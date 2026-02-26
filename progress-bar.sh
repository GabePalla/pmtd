#!/opt/homebrew/bin/bash
source ./debugger.sh

itens_done=$1
total=$2
length=$3
debug=$4

if [[ $debug == '-d' ]]; then
  activate_debug='true'
else
  activate_debug='false'
fi

perc_done=$((itens_done * 100 / total ))
num_bars=$((perc_done * length / 100))

progress_bar_perc=" ${perc_done}%"
progress_bar_perc_length=${#progress_bar_perc}

progress_bar_str='['

for ((i; i < num_bars; i++)); do 
  progress_bar_str+='='
done

sum=$(($num_bars + $progress_bar_perc_length))
debug $activate_debug "The sum of num_bars and progress_bar_perc_length is: $sum"

if [[ $sum -le $length ]]; then
  progress_bar_str+=$progress_bar_perc

  for ((i = num_bars; i < (length - $progress_bar_perc_length); i++)); do
    progress_bar_str+=' '
  done
else
  for ((i = num_bars; i < length; i++)); do
    progress_bar_str+=' '
  done
fi

debug $activate_debug "progress_bar_str length: ${#progress_bar_str} chars"

progress_bar_str+=']'

if [[ $sum -ge $length ]]; then
  progress_bar_str+=$progress_bar_perc
fi

echo "${progress_bar_str}"

