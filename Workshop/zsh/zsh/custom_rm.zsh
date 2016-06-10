# переопределить команду rm
rm() {
  # ошибка проверки
  [ $# -eq 0 ] && { echo "Файлы не выбраны"; return 1 }
  echo "$@" | grep -qe '-h\|--help' && { echo "Использование:  rm FILE..."; return 0 }
  echo "$@" | grep -q " -" && echo "Внимание : эта функция не поддерживает никаких флагов"
  # выбор нахождения корзины
  local DIRECTORY FILE
  local TRASHDIR="${HOME}/.local/share/Trash"
  local TRASHFILE="${TRASHDIR}/files"
  local TRASHINFO="${TRASHDIR}/info"
  for DIRECTORY in "${TRASHDIR}" "${TRASHFILE}" "${TRASHINFO}"; do
    if [ -e "${DIRECTORY}" ]; then
      [ -d "${DIRECTORY}" ] || { echo "'${DIRECTORY}' файл"; return 1 }
    else
      mkdir -p -m755 "${DIRECTORY}"
    fi
  done
  # подтвердить
  local CONFIRM=""
  echo -n "Вы действительно хотите удалить '$@'? [ny] "; read -k1 CONFIRM; echo
  [[ ! ${CONFIRM} =~ [yY] ]] && return 1
  # переместить / переехать
  for FILE in "$@"; do
    local DESTFILE="$(basename -- "${FILE}")"
    local SUFFIX='';
    local ITER=0;
    while [ -e "${TRASHFILE}/${DESTFILE}${SUFFIX}" ]; do
      SUFFIX="_${ITER}";
      ITER=$(expr ${ITER} + 1)
    done
    echo "Удалить '${FILE}'"
    if [ "$(dirname -- "$(readlink -f -- "${FILE}")")" == "${TRASHFILE}" ]; then
      /bin/rm -rf -- "${FILE}"
      /bin/rm -rf -- "${TRASHINFO}/${DESTFILE}.trashinfo"
    else
      mv -- "${FILE}" "${TRASHFILE}/${DESTFILE}${SUFFIX}" || return 1
      echo "[Trash Info]\nPath=$(readlink -f -- "${FILE}")\nDeletionDate=$(date +%Y-%m-%dT%H:%M:%S)" > "${TRASHINFO}/${DESTFILE}${SUFFIX}.trashinfo" || return 1
    fi
  done
}
