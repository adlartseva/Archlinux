# переопределить команду su
su() {
  local CHECKSU=0
  for FLAG in $*; do
    [[ ${FLAG} == "-" ]] && CHECKSU=1
    [[ ${FLAG} == "-l" ]] && CHECKSU=1
    [[ ${FLAG} == "--login" ]] && CHECKSU=1
  done
  if [[ ${CHECKSU} == 0 ]]; then
    echo "Используйте 'su -', Коты"
    /bin/su - $*
  else
    /bin/su $*
  fi
}
