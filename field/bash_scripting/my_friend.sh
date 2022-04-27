#!/bin/bash

# Welcome message
welcome="Hi, I am Bob your friend. How can I help you ?
\n\n
I can help you solve basic math operations such as:\n
a*b, a+b and a-b.
\n\n
I can tell you a joke.
\n
You can ask me about time or date.
\n\n
Type: 'say text you want to listen' and I'll repeat: text you want to listen.\n"

echo -e $welcome

game_on=true

while [[ $game_on == true ]]
do
  read -p $'\n'"What's your question ? :"$'\n' question

  pat='^.*([0-9]+[-\*\+\/]{1}[0-9]+)'
  exp='^say ([^0-9]+)'

  if [[ $question =~ $pat ]]
  then
    echo -e "\n${BASH_REMATCH[1]} equal: $((${BASH_REMATCH[1]}))\n"
  elif [[ $question == *'time'* ]]
  then
    echo -e "\nCurrent time is: $(date +'%T')\n"
  elif [[ $question == *'date'* ]]
  then
    echo -e "\nToday is: $(date +'%A, %B %d, %Y.')\n"
  elif [[ $question == *'joke'* ]]
  then
    echo $'\n'
    shuf -n 1 jokes
    echo $'\n'
  elif [[ $question =~ $exp ]]
  then
    espeak "${BASH_REMATCH[1]}"
  else
    echo -e "\nSorry, I'm not ready yet for this question\n"
  fi

  read -p "Would you like to continue, yes or no ? :"$'\n' check

  if [[ ($check == 'no') || ($check == 'n') ]]
  then
    game_on=false
    echo -e "\nThank you, bye!\n"
  fi
done
