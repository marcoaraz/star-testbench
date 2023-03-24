
#include these directories to search for stuff
+incdir+$PRJROOT/verif/src/plt_pwr_seq/
+incdir+$PRJROOT/verif/top/
+incdir+$PRJROOT/verif/tests/

#Add the wrappers here
$PRJROOT/verif/top/tb_wrapper.sv
#Add the packages needed to compile
$PRJROOT/verif/top/tb_top_pkg.sv
$PRJROOT/verif/tests/tb_test_pkg.sv
#Add the top file here
$PRJROOT/verif/top/tb_top.sv
