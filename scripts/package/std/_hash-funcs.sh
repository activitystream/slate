#!/bin/sh

hashStr()
{
  echo "$@" | sha1sum | awk '{print $1}'
}
hashFile()
{
  cat "$1" | sha1sum | awk '{print $1}'
}
hashDir()
{
  cd "$1"
  find . -type f \( ! -iname ".DS_*" \) -print0 | sort -z | xargs -0 sha1sum | sha1sum | awk '{print $1}'
}
