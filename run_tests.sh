#!/bin/bash

# Define the output log file
OUTPUT_LOG="final_report.txt"

# Clear the previous log file (if any)
> $OUTPUT_LOG

# Compile the C++ code with debugging symbols
echo "Compiling the C++ code..." | tee -a $OUTPUT_LOG
g++ -g -o memory memory.cpp
echo "Compilation completed.\n" | tee -a $OUTPUT_LOG

# Run AddressSanitizer
echo "Running AddressSanitizer..." | tee -a $OUTPUT_LOG
valgrind --tool=memcheck --leak-check=full --log-file=/dev/null ./memory 2>&1 | tee -a $OUTPUT_LOG
echo "AddressSanitizer completed." | tee -a $OUTPUT_LOG
echo "\n" | tee -a $OUTPUT_LOG

# Run Valgrind Memcheck
echo "Running Valgrind Memcheck..." | tee -a $OUTPUT_LOG
valgrind --tool=memcheck --leak-check=full --log-file=/dev/null ./memory 2>&1 | tee -a $OUTPUT_LOG
echo "Valgrind Memcheck completed." | tee -a $OUTPUT_LOG
echo "\n" | tee -a $OUTPUT_LOG

# Run Valgrind Massif
echo "Running Valgrind Massif..." | tee -a $OUTPUT_LOG
valgrind --tool=massif --log-file=/dev/null ./memory 2>&1 | tee -a $OUTPUT_LOG
echo "Valgrind Massif completed." | tee -a $OUTPUT_LOG
echo "\n" | tee -a $OUTPUT_LOG

# Run Valgrind DHAT
echo "Running Valgrind DHAT..." | tee -a $OUTPUT_LOG
valgrind --tool=dhat --log-file=/dev/null ./memory 2>&1 | tee -a $OUTPUT_LOG
echo "Valgrind DHAT completed." | tee -a $OUTPUT_LOG
echo "\n" | tee -a $OUTPUT_LOG

# Final completion message
echo "All tests completed. All logs are saved in $OUTPUT_LOG" | tee -a $OUTPUT_LOG
