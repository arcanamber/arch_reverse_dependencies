##############################
#                            #
# 2023 | https://electri.dev #
#                            #
##############################

#!/bin/sh
# Lists all Pacman packages with no reverse dependencies
# Requirements: pacman, pacman-contrib

packages=$(pacman -Q | awk '{print $1}')

for package in $packages
do
  pactree -r "$package" | \
  awk -v RS='' '/\n[ ├─]/ {sub(/[^\n]*\n[^\n]*\n/, ""); print; next} {sub(/\n[├─].*\n/, "\n")} 1' | \
  grep -v '[│└─]' || true
done
