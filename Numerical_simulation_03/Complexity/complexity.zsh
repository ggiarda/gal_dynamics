#!/bin/zsh

# Terminal command to run this script:
# zsh complexity.zsh

# Overwrite the time.out file if it already exists
echo -n > time.out

# Loop over the input files
for (( i=1000; i<=10000; i+=1000 )); do
    # Measure the execution time
    printf "Measuring execution time for input%d.txt...\n" $i
    /usr/bin/time -p ./treecode in=input${i}.txt out=output${i}.out dtime=0.01 eps=0.7 theta=0.3 tstop=3.3 dtout=0.1 > temp.out
    # Print the execution time to the output file
    printf "%d " $i >> time.out && cat temp.out | grep "user" | awk '{print $2}' >> time.out
done

# Remove the temporary file
rm -f temp.out

printf "Execution times written to time.out\n"