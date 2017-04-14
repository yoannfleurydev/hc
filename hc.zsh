#!/bin/zsh

alias hc='highlight_cat'

highlight_cat() {
  if [ ! -x "$(which highlight)" ]; then
    echo "Package \'highlight\' is not installed!"
    return -1
  fi

  for FNAME in $@
  do
    filename=$(basename "$FNAME")
    extension="${filename##*.}"
    cat $FNAME | highlight --out-format=xterm256 --force --syntax=$extension 2&> /dev/null
  done
}
