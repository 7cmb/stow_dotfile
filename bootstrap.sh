#!/bin/bash
#
# Make softlink to deploy my dotfile using stow

# make sure this script run in a correct environment

echo 'using bash when execute it on Debian'
set -o pipefail
whereis stow 2>&1 > /dev/null || ( echo 'ERROR: binary file 'stow' not found in $PATH ' && exit )
work_dir="$(realpath "${BASH_SOURCE[0]}")"
echo 'info: path to working directory is '"${work_dir}"

######
# Pass a string as a command to run in the iterator that iterates through packages
#####
function find_package(){
  [[ -n "$@" ]] || exit
  for i in $(find -maxdepth 1 -type d -name '*' -not -path . -not -path ..);do
    local prefix='./' 
    "$@" "${i##"$prefix"}"
  done
}

# list all packages on STDOUT
echo 'info: list all packages here below'
find_package "echo" "info:"

# confirm message
echo 'notification:' 'press "y" and enter to confirm that your packages is correct, then the stow will be run.'

#####
# Stow all the packages
#####
function stow_run(){
  ([[ $# -eq 1 ]] && [[ $@ -eq y ]]) || (echo "ERROR: unavailable input, please input a \"y\" and match case" && exit)
  find_package "stow"
}

# read input from STDIN
read -p 'input: ' input

# run stow
stow_run "$input"

echo "info: dotfile deployment successfully"

# init input argument to reuse it
input="n"
echo 'notification:' 'press "y" to prepare compressive package <Cascadia Code Nerd Font> and <Source Code Pro Nerd Font>'
read -p 'input: ' input
bash -c 'echo $input;exit'
if [[ "$input"="y" ]] && [[ -n "$input" ]];then
  curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/CascadiaCode.zip
  curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/SourceCodePro.zip
  echo 'please copy the file you need to `/usr/loacal/share/fonts` '
else
  echo 'notification:' 'don'"'"'t download anything'
fi
