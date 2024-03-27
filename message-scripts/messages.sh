message()
{
  ([ -n "$(tput setaf 1 2<&-)" ] && { tput setaf "$1" && tput bold && shift 1 && echo "$@" && tput sgr0; }) || (shift 1 && echo "$@")
}

info()
{
  message 4 "$@"
}

warning()
{
  message 3 "$@"
}

error()
{
  message 1 "$@"
}
