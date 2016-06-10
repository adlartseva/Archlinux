# Функция для извлечения архивов
# Пример : распаковываем файл
# Пример команды: unpack имя_архива.bz2
unpack() {
  if [[ -f $1 ]]; then
    case $1 in
      *.tar.bz2)   tar xjfv $1                             ;;
      *.tar.gz)    tar xzfv $1                             ;;
      *.tar.xz)    tar xvJf $1                             ;;
      *.bz2)       bunzip2 $1                              ;;
      *.gz)        gunzip $1                               ;;
      *.rar)       unrar x $1                              ;;
      *.tar)       tar xf $1                               ;;
      *.tbz)       tar xjvf $1                             ;;
      *.tbz2)      tar xjf $1                              ;;
      *.tgz)       tar xzf $1                              ;;
      *.zip)       unzip $1                                ;;
      *.Z)         uncompress $1                           ;;
      *.7z)        7z x $1                                 ;;
      *)           echo "Я не знаю, как извлечь '$1'" ;;
    esac
  else
    case $1 in
      *help)       echo "Использование: распаковка АРХИВ_ИМЯ"       ;;
      *)           echo "'$1' не является допустимым файлом"        ;;
    esac
  fi
}


# Функция для создания архивов
# Пример : пакет архивный файл
# Пример команды: pack 7z /что/мы/пакуем имя_файла.7z
pack() {
  if [ $1 ]; then
    case $1 in
      tar.bz2)     tar -cjvf $2.tar.bz2 $2                 ;;
      tar.gz)      tar -czvf $2.tar.bz2 $2                 ;;
      tar.xz)      tar -cf - $2 | xz -9 -c - > $2.tar.xz   ;;
      bz2)         bzip $2                                 ;;
      gz)          gzip -c -9 -n $2 > $2.gz                ;;
      tar)         tar cpvf $2.tar  $2                     ;;
      tbz)         tar cjvf $2.tar.bz2 $2                  ;;
      tgz)         tar czvf $2.tar.gz  $2                  ;;
      zip)         zip -r $2.zip $2                        ;;
      7z)          7z a $2.7z $2                           ;;
      *help)       echo "Применение: пакет ТИП ФАЙЛЫ"                     ;;
      *)           echo "'$1' не могут быть упакованы с помощью пакета()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
