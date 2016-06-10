# авто предложение
if [[ -a "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
else
    source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=black'
bindkey '^ ' autosuggest-accept
bindkey '^B' autosuggest-clear

# подсветка синтаксиса
if [[ -a "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
else
    source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
# Главная подсветка, курсора, парных скобок, root
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern root)
# подсветка парных скобок 
# Цвета для уровней скобок с 1 по 4 -ый
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=magenta,bold'
# Цвет парной скобки, если курсор на скобке
ZSH_HIGHLIGHT_STYLES[cursor--matchingbracket]='fg=gray,bold'
# подсветка курсора
ZSH_HIGHLIGHT_STYLES[cursor]='bg=blue'
# главная подсветка
# стандартный цвет
ZSH_HIGHLIGHT_STYLES[default]='none'
# неизвестная команда
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
# зарезервированное слово
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=magenta,bold'
# алиас
ZSH_HIGHLIGHT_STYLES[alias]='fg=yellow,bold'
# built-in функция (например, echo)
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
# функция, определенная в шелле
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
# обычная команда
ZSH_HIGHLIGHT_STYLES[command]='fg=green'
# пре-команда (например, sudo в sudo cp ...)
ZSH_HIGHLIGHT_STYLES[precommand]='fg=blue,bold'
# разделитель команд, && || ;
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=yellow'
# команда, найденная в путях (hashed)
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green'
# флаги типа -*
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue,bold'
# флаги типа --*
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=blue,bold'
# path
# стандартный путь
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan,bold'
# префикс пути
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=cyan'
# примерный путь
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=cyan'
# shell
# шаблон (например, /dev/sda*)
ZSH_HIGHLIGHT_STYLES[globbing]='fg=cyan'
# подстановка из истории (команда, начинающаяся с !)
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=blue'
# присвоение
ZSH_HIGHLIGHT_STYLES[assign]='fg=magenta'
# конструкции типа "$VARIABLE"
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan'
# конструкции типа \"
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'
# конструкции типа `command`
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=blue'
# quotes
# конструкции типа 'text'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow,underline'
# конструкции типа "text"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
# pattern
ZSH_HIGHLIGHT_PATTERNS+=('\~b/rm ' 'fg=green')
#выделить фон для команды rm -rf красным цветом:
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')
# подсветка root
ZSH_HIGHLIGHT_STYLES[root]='bg=red'
