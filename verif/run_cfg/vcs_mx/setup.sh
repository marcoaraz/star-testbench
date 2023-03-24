# !/bin/sh

echo "   setup.sh in tools/vcs -- make changes to the used synopsys_sim.setup file --"
rm -f $PRJROOT/verif/run_cfg/vcs_mx/synopsys_sim.setup
#INIFILE_DEFAULT_PATH=/home/tool/vcs_mx_2018_9/vcs-mx/O-2018.09-SP2-3/bin/synopsys_sim.setup
INIFILE_DEFAULT_PATH="$VCS_HOME/bin/synopsys_sim.setup"
INIFILE_PATH=$PRJROOT/verif/run_cfg/vcs_mx/synopsys_sim.setup

mkdir -p $PRJROOT/verif/run_cfg/vcs_mx/libs

#cp -f $INIFILE_DEFAULT_PATH $INIFILE_PATH
