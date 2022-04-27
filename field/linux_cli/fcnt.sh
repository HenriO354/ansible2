#!/bin/bash

file_count=$(ls $1 | wc -l)

echo $file_count files in $1

echo $$ is the process ID of the script $0

echo The current line number of the script is $LINENO

echo $SECONDS is the number of seconds the script has been running for.
