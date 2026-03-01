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

perc_and_num_bars_length=$(($num_bars + $progress_bar_perc_length))
debug $activate_debug "The sum of num_bars and progress_bar_perc_length is: $perc_and_num_bars_length"

debug $activate_debug "Param num_bars length before if statement: $num_bars"

if [[ $perc_and_num_bars_length -le $length ]]; then
  progress_bar_str+=$progress_bar_perc
  num_bars=$(( ${#progress_bar_perc} + $num_bars ))
fi

debug $activate_debug "Param num_bars length after if statement: $num_bars"

for ((i = $num_bars; i < length; i++)); do
    progress_bar_str+=' '
done

debug $activate_debug "progress_bar_str length: ${#progress_bar_str} chars"

progress_bar_str+=']'

if [[ $perc_and_num_bars_length -gt $length ]]; then
  progress_bar_str+=$progress_bar_perc
fi

echo "${progress_bar_str}"

