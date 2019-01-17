#!/bin/bash
if [[ -z "$1" ]]
then
  message="nothing"
else
  message=$1
fi
echo "Hi today we are $0 and say $message"