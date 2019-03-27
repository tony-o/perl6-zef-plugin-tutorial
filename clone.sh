#!/bin/bash

PWD=`pwd`

if [[ ! -d "zef" ]]; then
  printf "Cloning zef...\n"
  git clone git@github.com:ugexe/zef.git zef
fi

cd zef
if [[ "$(git status | grep 'On branch' | awk '{print $3}')" != "allow-runtime-interface-plugins" ]]; then
  printf "Checking out plugin branch...\n"
  git fetch origin allow-runtime-interface-plugins
  git checkout allow-runtime-interface-plugins
fi

git pull

printf "\nAll set.\n\nYou can run the following command to follow along with the tutorial.\n  %s\n\n" "alias zef-p='perl6 -I$(pwd)/lib $(pwd)/bin/zef'"

cd $PWD
