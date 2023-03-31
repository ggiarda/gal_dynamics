#!/bin/zsh

# Terminal command to run this script:
# zsh complexity.zsh

# Loop over the range of integers from 10 to 100 with a step of 10 and measure the execution time of the program for each input file
for ((i=10; i<=100; i+=10))
do
  input_file="input${i}.txt"
  echo "Measuring execution time for ${input_file}..."
  
  # Measure the execution time using the `time` command and write the output to a file
  echo -n "N=${i}: " >> time.out
  /usr/bin/time -f "%e" ./my_program < ${input_file} 2>&1 | tee -a time.out
done

echo "Execution times written to time.out"
