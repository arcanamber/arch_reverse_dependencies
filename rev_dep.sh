#!/bin/sh

###############################
#                             #
# 2023 | https://electri.dev/ #
#                             #
###############################

for package in $(pacman -Qq)
do
  if [[ $(pactree -r $package | wc -l) -eq 1 ]]; then
    echo $package
  fi
done
