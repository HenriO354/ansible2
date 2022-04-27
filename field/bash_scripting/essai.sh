#!/bin/bash

pat='<h4 .+>(\$[0-9]+.?[0-9]+)<\/h4>'
text='<h4 class="pull-right price">$295.99</h4>'

if [[ $text =~ $pat ]]
then
  echo "text=${BASH_REMATCH[1]}"
else
  echo bad
fi

echo $text | sed 's:<h/4>::'