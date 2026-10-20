# CMake generated Testfile for 
# Source directory: /Users/wens/MC_Program/CGMF/utils/cgmf/tests/u238nf-10MeV-events
# Build directory: /Users/wens/MC_Program/CGMF/build/utils/cgmf/tests/u238nf-10MeV-events
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(cgmf_u238nf-10-events_mpi-init "/opt/homebrew/bin/cmake" "-E" "remove" "histories.cgmf.parallel.0" "histories.cgmf.parallel.1")
set_tests_properties(cgmf_u238nf-10-events_mpi-init PROPERTIES  FIXTURES_SETUP "cgmf_u238nf-10-events_mpi-init" _BACKTRACE_TRIPLES "/Users/wens/MC_Program/CGMF/utils/cgmf/tests/u238nf-10MeV-events/CMakeLists.txt;41;add_test;/Users/wens/MC_Program/CGMF/utils/cgmf/tests/u238nf-10MeV-events/CMakeLists.txt;0;")
add_test(cgmf_u238nf-10-events_mpi-exec "/opt/homebrew/bin/mpiexec" "-n" "2" "/Users/wens/MC_Program/CGMF/build/utils/cgmf/cgmf.mpi.x" "-n" "20" "-e" "10.0" "-i" "92238" "-f" "histories.cgmf.parallel")
set_tests_properties(cgmf_u238nf-10-events_mpi-exec PROPERTIES  FIXTURES_REQUIRED "cgmf_u238nf-10-events_mpi-init" FIXTURES_SETUP "cgmf_u238nf-10-events_mpi-exec" _BACKTRACE_TRIPLES "/Users/wens/MC_Program/CGMF/utils/cgmf/tests/u238nf-10MeV-events/CMakeLists.txt;48;add_test;/Users/wens/MC_Program/CGMF/utils/cgmf/tests/u238nf-10MeV-events/CMakeLists.txt;0;")
add_test(cgmf_u238nf-10-events_mpi-diff-0 "/opt/homebrew/bin/cmake" "-E" "compare_files" "histories.cgmf.parallel.0.reference" "histories.cgmf.parallel.0")
set_tests_properties(cgmf_u238nf-10-events_mpi-diff-0 PROPERTIES  FIXTURES_REQUIRED "cgmf_u238nf-10-events_mpi-exec" _BACKTRACE_TRIPLES "/Users/wens/MC_Program/CGMF/utils/cgmf/tests/u238nf-10MeV-events/CMakeLists.txt;57;add_test;/Users/wens/MC_Program/CGMF/utils/cgmf/tests/u238nf-10MeV-events/CMakeLists.txt;0;")
add_test(cgmf_u238nf-10-events_mpi-diff-1 "/opt/homebrew/bin/cmake" "-E" "compare_files" "histories.cgmf.parallel.1.reference" "histories.cgmf.parallel.1")
set_tests_properties(cgmf_u238nf-10-events_mpi-diff-1 PROPERTIES  FIXTURES_REQUIRED "cgmf_u238nf-10-events_mpi-exec" _BACKTRACE_TRIPLES "/Users/wens/MC_Program/CGMF/utils/cgmf/tests/u238nf-10MeV-events/CMakeLists.txt;63;add_test;/Users/wens/MC_Program/CGMF/utils/cgmf/tests/u238nf-10MeV-events/CMakeLists.txt;0;")
