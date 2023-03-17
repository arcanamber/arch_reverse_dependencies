#!/bin/bash

for package in $(pacman -Qq)
do
  if [[ $(pactree -r $package | wc -l) -eq 1 ]]; then
    echo $package
  fi
done

