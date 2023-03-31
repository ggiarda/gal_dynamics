#!/bin/zsh

# Terminal command to run this script:
# zsh complexity.zsh

# Overwrite the time.out file if it already exists
echo -n > time.out

# Loop over the input files
for i in {10..100..10}; do
    # Measure the execution time
    printf "Measuring execution time for input%d.txt...\n" $i
    /usr/bin/time -p ./nbody_sh1 -d 0.03 -o 0.01 -t 1.1107207345395915 < input${i}.txt > output_sphere${i}.out 2> temp.out
    # Print the execution time to the output file
    printf "%d " $i >> time.out && cat temp.out | grep "user" | awk '{print $2}' >> time.out
done

# Remove the temporary file
rm -f temp.out

printf "Execution times written to time.out\n"