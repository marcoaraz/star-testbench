#!/bin/sh
# local settings

function print_help {
   echo "supported arguments:";
   echo "   -a                              download all design files"
   echo "   -u                              update files to latest version";
   echo "   --reg                           setup for regression test";
   echo "   -h    (or --help)               prints this help";
}

# ------------------------------------------------------------------------------
# Default values
regression=0;
stop=0;
all=0;
udep=0;


# ------------------------------------------------------------------------------
# A string with command options
options=$@

# ------------------------------------------------------------------------------
# An array with all the arguments
arguments=($options)
# ------------------------------------------------------------------------------
# Loop index
index=0
for argument in $options
   do
     # Incrementing index
     index=`expr $index + 1`

     # The conditions
     case $argument in
       --reg)                  regression=1;;
       -a)                     all=1;;
       -u)                     udep=1;;
       -h)                     print_help
                               stop=1;;
       -*)                     echo "unsupported argument <$argument> with argument <${arguments[index]}>";
                               print_help
                               stop=1 ;;
     esac
   done
shift

#if you only want to setup the project path and variables without updating/downloading design
if [[ "$all" = "0" && "$udep" = "0" ]]; then
  echo "ONLY SETUP PROJECT PATH"
  only=1
fi


echo "########################### SOURCEME ############################"

export PRJROOT=${PWD}
echo "   PRJROOT           = $PRJROOT"

export DESIGNWARE_HOME=/nfs/pdx/disks/fpga/tools/synopsys
echo "   DESIGNWARE_HOME   = $DESIGNWARE_HOME"
export DESIGNWARE_INCDIR=$PRJROOT/designware/
echo "   DESIGNWARE_INCDIR = $DESIGNWARE_INCDIR" 
GIT_ROOT_PATH=`git rev-parse --show-toplevel`
echo "   GIT_ROOT_PATH     = $GIT_ROOT_PATH"
echo ""

DEP_FILE=$PRJROOT/dep_spec
TOOL_FILE=$PRJROOT/tool_spec

url=()
path=()
hash=()
branch=()
parameter=()

#setup the simulator, for only it only supports VCS
old_path=`echo $PATH`

export VENDOR="VCS-MX"

#set search path for simv
proj_path=$PRJROOT/verif/run_cfg
result=$(echo $old_path | grep "${proj_path}")
  
if [[ "$result" != "" ]] ; then
  echo "   PRJROOT path include in PATH for design"
else
  echo "   PRJROOT path not include in PATH for design"
  export PATH=$PATH:$PRJROOT/verif/run_cfg
fi
echo "   Setup VCS-MX enrivoment!"
echo ""

#regression test setup
if [ "$regression" = "1" ] ; then
   if [ -f ~/temp_proj.log ] ; then
      rm ~/temp_proj.log
   fi
   echo $PRJROOT > ~/temp_proj.log
   echo "   Regression test setup!"
fi

cd $GIT_ROOT_PATH

echo "--------------------GIT SUBMODULE SETUP START--------------------"

i=0;

cd $PRJROOT

#read dep_spec file and obtain design repository parameters like branch and commit, and where to store it in the verif env directory
while read LINE
do
  #echo "$LINE" #for debug 

  str=$LINE
  OLD_IFS="$IFS"
  IFS="="
  arr=($str)
  IFS="$OLD_IFS"

  left=${arr[0]}
  right=${arr[1]}

  if [ "$left" = "GIT_REPO_URL" ]; then #URL of a given directory
    url[$i]=$right
  elif [ "$left" = "LOCAL_PATH" ]; then #local path of where to store this repo in the verif env directory
    path[$i]=$right
  elif [ "$left" = "HASH_NUMBER" ]; then #number of commit we want to download
    hash[$i]=$right
  elif [ "$left" = "BRANCH_NAME" ]; then #branch name of the commit we want to download
    branch[$i]=$right 
  elif [ "$left" = "EXPORT_PARAMETER" ]; then #parameter to associate the local path to
    parameter[$i]=$right
    let "i=i+1"
  else
    if [[ $LINE = "" || $LINE = \#* ]]; then
      usleep
    else
      echo "Invalid parameter in dep file!"
      echo "$LINE"
    fi
  fi

done < $DEP_FILE

#if we only want to setup project paths, we search for the RTL_MAIN_PATH, if one exists, setup RTL_PATH as the design/ directory
cd $PRJROOT
if [ "$only" = "1" ] ; then
   for((k=0;k<${#url[@]};k++));
   do
      if [ ${parameter[$k]} = "RTL_MAIN_PATH" ]; then
        export RTL_PATH=$PRJROOT/design
      fi
   done
fi

# if -u or -a was specified, we need to download/update all the repos listes in dep_spec
cd $GIT_ROOT_PATH
if [[ "$all" = "1" || "$udep" = "1" ]] ; then
   for((j=0;j<${#url[@]};j++));
   do
      echo "*****************************************************************"
      if [ "$all" = "1" ] ; then #if -a, first download the repos specified in dep_spec
         git clone ${url[$j]} ${path[$j]}
      fi

      if [ ! -d ${path[$j]} ] ; then #if path in LOCAL_PATH does not exists, create it
        echo "create ${path[$j]} folder..."
        mkdir ${path[$j]}
      fi

      #setup the repos with HASH_NUMBER and BRANCH_NAME specified in dep_spec for each repo in the list
      cd ${path[$j]}
      git checkout ${branch[$j]}
      git pull origin ${branch[$j]}
      git reset --hard ${hash[$j]}
      cd $PRJROOT

      #we search for the RTL_MAIN_PATH, if one exists, setup RTL_PATH as the design/ directory
      if [ ${parameter[$j]} = "RTL_MAIN_PATH" ]; then
        export RTL_PATH=$PRJROOT/design
      fi

      echo "*****************************************************************"
   done

fi
echo "--------------------GIT SUBMODULE SETUP DONE---------------------"

#setup the environment variables for the tool specified in tool_spec
cd $PRJROOT
echo "------------------------TOOL SETUP START-------------------------"
cd $PRJROOT
while read LINE
do
  #echo "$LINE" #for debug 

  str=$LINE
  OLD_IFS="$IFS"
  IFS="="
  arr=($str)
  IFS="$OLD_IFS"

  left=${arr[0]}
  right=${arr[1]}

  if [ "$left" = "QUARTUS_INSTALL_DIR" ]; then
    export QUARTUS_INSTALL_DIR=$right
  elif [ "$left" = "VCS_HOME" ]; then 
    export VCS_HOME=$right
    export PATH=$VCS_HOME/bin:$PATH
  else
    if [[ $LINE = "" || $LINE = \#* ]]; then
      usleep
    else
      echo "Invalid parameter in dep file!"
      echo "$LINE"
    fi
  fi


done < $TOOL_FILE
echo "------------------------TOOL SETUP DONE--------------------------"

echo "######################## SOURCEME DONE ##########################"
cd $PRJROOT




