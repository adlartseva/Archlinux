# автозавершение команд
autoload -U compinit
compinit
# меню выбора
zstyle ':completion:*' menu select
# автозавершение команд bash
autoload -Uz bashcompinit
bashcompinit
## включается автодополнение, если вы ничего не набрали 2-е опечатки
zstyle ':completion:*' insert-tab false
zstyle ':completion:*' max-errors 2
# цветной вывод
autoload -U colors && colors
# настройка строки приглашения
autoload -U promptinit
promptinit
# корректировка опечаток (и шаблон вопроса)
setopt CORRECT_ALL
SPROMPT="Correct '%R' to '%r' ? ([Y]es/[N]o/[E]dit/[A]bort) "
## Убрать дополнение исполняемых файлов по =cmd
unsetopt EQUALS

zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:processes' sort false