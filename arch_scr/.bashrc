#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Переменные окружения
export EDITOR="$(if [[ -n $DISPLAY ]]; then echo 'leafpad'; else echo 'nano'; fi)" # leafpad, nano

# Цветной терминал
INPUT_COLOR="\[\033[0m\]"
DIR_COLOR="\[\033[0;33m\]"
DIR="\w"

LINE_VERTICAL="\342\224\200"
LINE_CORNER_1="\342\224\214"
LINE_CORNER_2="\342\224\224"
LINE_COLOR="\[\033[0;37m\]"
 
USER_NAME="\[\033[0;32m\]\u"
SYMBOL="\[\033[0;32m\]$"
 
if [[ ${EUID} == 0 ]]; then
    USER_NAME="\[\033[0;31m\]\u"
    SYMBOL="\[\033[0;31m\]#"
fi
 
PS1="$LINE_COLOR$LINE_CORNER_1$LINE_VERTICAL $USER_NAME $DIR_COLOR$DIR \n$LINE_COLOR$LINE_CORNER_2$LINE_VERTICAL $SYMBOL $INPUT_COLOR"

 # цветной nano
alias ls='ls --color=always'
alias dmesg='dmesg --color=always'
alias grep='grep --color=always'
alias gcc='gcc -fdiagnostics-color=always'
alias pacman='pacman --color=always'
alias dir='dir --color=always'

# pacman aliases
alias pac="sudo /usr/bin/pacman -S"		# установить один или несколько пакетов
alias pacu="sudo /usr/bin/pacman -Syu"	# обновить все пакеты
alias pacr="sudo /usr/bin/pacman -Rns"	# удалить один или несколько пакетов
alias pacs="/usr/bin/pacman -Ss"		# поиск пакета с одним и более слов
alias paci="/usr/bin/pacman -Si"		# показать инфо о пакете
alias paclo="/usr/bin/pacman -Qdt"		# список пакетов, которые являются осиротевшими (не требуются, как зависимости)
alias pacc="sudo /usr/bin/pacman -Scc"	# полностью очитить кэш
alias paclf="/usr/bin/pacman -Ql"		# для получения списка файлов установленного пакета

# удалить все осиротевшиее пакеты
alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rns \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"

# сборная солянка
alias psync='sudo pacman -Syy'  # полное обновление базы данных пакетов
alias paco='sudo pacman -Sc && sudo pacman-optimize'   # удаление из кэша всех неустановленных пакетов и неиспользуемых репозиториев
alias q='exit'   # выход
alias yrt='yaourt -S'   # тут все ясно
alias led='leafpad ~/.bashrc'  # открыть bashrc
alias bsu='source ~/.bashrc'   # для вступления в силу изменений
alias fig='sudo leafpad /etc/pacman.conf'  # открыть pacman.conf
alias md='sudo updatedb'  # обновить базу mlocate
alias lcp='sudo localepurge'  # для удаления ненужных локализаций
alias lcc='sudo /usr/bin/localepurge-config'  # обновить конфиг
alias speed='speedtest-cli'    # проверка скорости интернета
alias subl='subl3'  # открыть sublime text
alias music='ncmpcpp'  # клиент для mpd
alias wttr='alias wttr='wget -O - wttr.in/"Rostov-on-don" -q''  # для wego (wttr.in)