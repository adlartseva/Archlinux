# указыаем файл с историей, число команд хранящ. в кэше текущего сеанса и число команд, хранящихся в файле
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=500000
SAVEHIST=500000
# Не сохраняем дубликаты в историю
setopt HIST_IGNORE_ALL_DUPS
# дополнение истории (не затирать изменения)
setopt APPEND_HISTORY
# ...и лишние пробелы тоже...
setopt HIST_IGNORE_SPACE
# ...и пустые строки
setopt HIST_REDUCE_BLANKS
# вместо /mnt/hard/music, можно написать /m/h/m/ и нажать Enter и сразу переместимся в каталог. 
# Если вариантов перехода несколько, то zsh предложит выбрать
autoload -Uz compinit
compinit
# меню выбора
zstyle ':completion:*' menu select
# для bash
autoload -Uz bashcompinit
bashcompinit
# включается автодополнение, если вы ничего не набрали после приглашения, указываем максимальное возможное число опечаток,
# которые zsh может исправить при использовании автокомплита для команд
zstyle ':completion:*' insert-tab false
zstyle ':completion:*' max-errors 2
# цветной вывод
autoload -U colors
colors
# настройка строки приглашения
autoload -U promptinit
promptinit
# корректировка опечаток (и шаблон вопроса)
setopt CORRECT_ALL
SPROMPT="Correct '%R' to '%r' ? ([Y]es/[N]o/[E]dit/[A]bort) "
# Убрать дополнение исполняемых файлов по =cmd
unsetopt EQUALS
# autocd
setopt autocd
## Отключение звукового сигнала
## при ошибках
unsetopt beep
# включаем калькулятор
autoload zcalc
# автоматически log в 10 * 60 сек бездействия
export TMOUT=600


RPROMPT=$(git_promt)$' %{\e[1;37m%}[%{\e[1;36m%}%T%{\e[1;37m%}]%{\e[0m%} '$(batcharge)

#Отключаем спикер
unsetopt beep
# Редактор и пейджер
export EDITOR="vim"
export PAGER="vimpager"
###################################