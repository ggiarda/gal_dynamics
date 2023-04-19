#!/bin/zsh

# Terminal command to run this script:
# zsh complexity.zsh

# Overwrite the time.out file if it already exists
echo -n > time.out

# define input arguments
dtime=0.01
eps=0.7
theta=0.3
tstop=3.3
dtout=0.1

# loop over input files
for i in {1000..10000..1000}; do
  input="input$i.txt"
  output="output$i.txt"

  # measure execution time
  runtime=$(TIMEFORMAT='%R'; time (./treecode in=$input out=$output dtime=$dtime eps=$eps theta=$theta tstop=$tstop dtout=$dtout) 2>&1 >/dev/null)

  # print result to console
  echo "Execution time for $input: $runtime seconds"

  # write result to file
  echo $runtime >> time.out
done

printf "Execution times written to time.out\n"