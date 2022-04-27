#!/bin/bash

param=$1

$(ssh -p 2220 ${param}@bandit.labs.overthewire.org)
