#!/bin/bash
for filename in `find . | egrep '\.cpp'`; 
do 
  gcov-5 -n -o . $filename > /dev/null; 
done
for filename in `find . | egrep '\.c'`; 
do 
  gcov-5 -n -o . $filename > /dev/null; 
done
