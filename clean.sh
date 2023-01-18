#!/bin/sh


function print_help {
   echo "supported arguments:";
   echo "   -h    (or --help)               prints this help";
}

#fpga target: node(0), gpu(1), cosim(2)
target=0;
ses=0;
#verdi ses

vcs=1;

options=$@

#Loop index
index=0;
for argument in $options
    do
        index=`expr $index +1`
        
        case $argument in
	        --ses)          ses=1;;
            -h)             print_help;;
            -*)             echo "upsupported argument <$argument> with argument <${arguments[index]}>";
                            print_help;;
         esac
     done
shift
                            
export PRJROOT=${PWD}

runcfgPath=$PRJROOT/verif/run_cfg

testPath=$PRJROOT/verif/tests

echo "clean libs and sysnopsys_sim.setup"
echo "clean libs and modelsim.ini"


cd $runcfgPath
# find . -name 'sysnopsys_sim.setup' -type f -print -exec rm -rf {};
# find . -name 'modelsim.ini' -type f -print -exec rm -rf {};
find $runcfgPath -type f -name 'sysnopsys_sim.setup' -print0 |xargs -0 -I {} rm -v {};
find $runcfgPath -type f -name 'modelsim.ini' -print0 |xargs -0 -I {} rm -v {};



echo "clean compile log..."


cd $runcfgPath
find $runcfgPath -type d -name 'csrc' -print0 |xargs -0 -I {} rm -rf -v {};
find $runcfgPath -type d -name 'simv.daidir' -print0 |xargs -0 -I {} rm -rf -v {};
find $runcfgPath -type f -name 'simv' -print0 |xargs -0 -I {} rm -v {};
find $runcfgPath -type d -name 'work.lib++' -print0 |xargs -0 -I {} rm -rf -v {};
find $runcfgPath -type d -name 'AN.DB' -print0 |xargs -0 -I {} rm -rf -v {};
find $runcfgPath -type d -name '64' -print0 |xargs -0 -I {} rm -rf -v {};
find $runcfgPath -type f -name '*.log' -print0 |xargs -0 -I {} rm -v {};
find $runcfgPath -type f -name 'vc_hdrs.h' -print0 |xargs -0 -I {} rm -v {};
find $runcfgPath -type d -name 'simv.vdb' -print0 |xargs -0 -I {} rm -rf -v {};

find $runcfgPath/vcs_mx -type d -name 'libs' -print0 |xargs -0 -I {} rm -rf -v {};
find $runcfgPath/vcs_mx -type f -name 'setup.h' -print0 |xargs -0 -I {} rm -v {};
find $runcfgPath/vcs_mx -type f -name 'synopsys_sim.setup' -print0 |xargs -0 -I {} rm -v {};
find $runcfgPath -type f -name 'novas*' -print0 |xargs -0 -I {} rm -v {};

echo "clean test case running files..."




echo "clean test case running files..."    
cd $testPath

for e in `ls $testPath`
  do
    if [ -f $testPath/$e ] ; then
      #fullpath=$testPath
      echo $testPath/$e
    else
      fullpath=$testPath/$e/ 
      find $fullpath -type f -name '*.fsdb' -print0 |xargs -0 -I {} rm -v {};
      find $fullpath -type f -name 'novas*' -print0 |xargs -0 -I {} rm -v {};
      find $fullpath -type l -name 'simv.daidir' -print0 |xargs -0 -I {} rm -rf -v {};
      find $fullpath -type f -name '*.vpd' -print0 |xargs -0 -I {} rm -v {};
      find $fullpath -type f -name '*.log' -print0 |xargs -0 -I {} rm -v {};
      find $fullpath -type f -name 'ucli.key' -print0 |xargs -0 -I {} rm -v {};
      find $fullpath -type d -name 'verdiLog' -print0 |xargs -0 -I {} rm -rf -v {};
      find $fullpath -type f -name 'DVEfiles' -print0 |xargs -0 -I {} rm -v {};
      find $fullpath -type f -name '*.out' -print0 |xargs -0 -I {} rm -v {};
      find $fullpath -type f -name '*.fsdb.*' -print0 |xargs -0 -I {} rm -v {};

      if [ "$ses" == "1" ] ; then
        find $tesPath -type f -name 'Verdi.*' -print0 |xargs -0 -I {} rm -v {};
      fi

      fi
  done


