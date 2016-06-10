## History
# история
HISTFILE="${HOME}/.zsh_history"    # указыаем файл с историей
HISTSIZE=500000           # число команд хранящ. в кэше текущего сеанса
SAVEHIST=500000            # число команд, хранящихся в файле
# Не сохраняем дубликаты в историю
setopt HIST_IGNORE_ALL_DUPS
# дополнение истории (не затирать изменения)
setopt APPEND_HISTORY
# ...и лишние пробелы тоже...
setopt HIST_IGNORE_SPACE
# ...и пустые строки
setopt HIST_REDUCE_BLANKS