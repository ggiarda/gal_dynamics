#!/bin/zsh

# Terminal command to run this script:
# zsh complexity.zsh

# Loop over the range of integers from 10 to 100 with a step of 10 and measure the execution time of the program for each input file
for ((i=10; i<=100; i+=10))
do
  input_file="input${i}.txt"
  output_file="output_sphere${i}.out"
  echo "Measuring execution time for ${input_file}..."
  
  # Measure the execution time using the `time` command and write the output to a file
  { time ./nbody_sh1 -d 0.03 -o 0.01 -t 1.1107207345395915 < ${input_file} > ${output_file} ; } 2> ${i}_time.out
  
  # Extract the user and system time from the `time` output and write them to the main time.out file, along with the value of N
  user_time=$(grep "user" ${i}_time.out | awk '{print $2}')
  sys_time=$(grep "sys" ${i}_time.out | awk '{print $2}')
  total_time=$(echo "$user_time + $sys_time" | bc)
  echo "${i} ${total_time}" >> time.out
  
  # Remove the temporary time output file
  rm ${i}_time.out
done

echo "Execution times written to time.out"
