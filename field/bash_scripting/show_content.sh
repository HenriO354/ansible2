#!/bin/bash

arg=$1

if [ -d $arg ]; then
  echo -e "\n"
  ls $arg
elif [ -f $arg ]; then
  echo -e "\n"
  cat $arg
else
  echo -e "\n"
  echo this is neither a file nor a directory
fi
