# CMake generated Testfile for 
# Source directory: /Users/wens/MC_Program/CGMF/utils/cgmf/tests/cf252sf-yields
# Build directory: /Users/wens/MC_Program/CGMF/build/utils/cgmf/tests/cf252sf-yields
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(cgmf_cf252sf-yields_mpi-init "/opt/homebrew/bin/cmake" "-E" "remove" "yields.cgmf.parallel.0")
set_tests_properties(cgmf_cf252sf-yields_mpi-init PROPERTIES  FIXTURES_SETUP "cgmf_cf252sf-yields_mpi-init" _BACKTRACE_TRIPLES "/Users/wens/MC_Program/CGMF/utils/cgmf/tests/cf252sf-yields/CMakeLists.txt;35;add_test;/Users/wens/MC_Program/CGMF/utils/cgmf/tests/cf252sf-yields/CMakeLists.txt;0;")
add_test(cgmf_cf252sf-yields_mpi-exec "/opt/homebrew/bin/mpiexec" "-n" "2" "/Users/wens/MC_Program/CGMF/build/utils/cgmf/cgmf.mpi.x" "-n" "-1000" "-e" "0.0" "-i" "98252" "-f" "yields.cgmf.parallel")
set_tests_properties(cgmf_cf252sf-yields_mpi-exec PROPERTIES  FIXTURES_REQUIRED "cgmf_cf252sf-yields_mpi-init" FIXTURES_SETUP "cgmf_cf252sf-yields_mpi-exec" _BACKTRACE_TRIPLES "/Users/wens/MC_Program/CGMF/utils/cgmf/tests/cf252sf-yields/CMakeLists.txt;42;add_test;/Users/wens/MC_Program/CGMF/utils/cgmf/tests/cf252sf-yields/CMakeLists.txt;0;")
add_test(cgmf_cf252sf-yields_mpi-diff-0 "/opt/homebrew/bin/cmake" "-E" "compare_files" "yields.cgmf.serial.0.reference" "yields.cgmf.parallel.0")
set_tests_properties(cgmf_cf252sf-yields_mpi-diff-0 PROPERTIES  FIXTURES_REQUIRED "cgmf_cf252sf-yields_mpi-exec" _BACKTRACE_TRIPLES "/Users/wens/MC_Program/CGMF/utils/cgmf/tests/cf252sf-yields/CMakeLists.txt;51;add_test;/Users/wens/MC_Program/CGMF/utils/cgmf/tests/cf252sf-yields/CMakeLists.txt;0;")
