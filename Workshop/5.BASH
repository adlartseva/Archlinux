############
## BASHRC ##
#############
## install ##
#############

$ sudo pacman -S vim vimpager  # установим консольный текстовый редактор

$ sudo pacman -S bash-complition  # автодополнение для bash

$ source ~/.bahrc  # после любых изменений в .bahrc необходимо перезагрузить его этой командой.


##########

# в этой строчки зададим запуск nano в X, а в терминал geany
export EDITOR="$(if [[ -n $DISPLAY ]]; then echo 'nano'; else echo 'geany'; fi)"

export HISTCONTROL=ignoredups  # предотвратить запись в историю bash двук одтнаковых команд

export PROMPT_COMMAND='echo -ne "\033]0;$PWD\007"'  # добавит в загаловок полный путь к текущей папке

export HISTCONTROL=ignorespace:ignoredups:erasedups  # отключить запись в историю команд строк, начинающихся с пробелов

export HISTCONTROL=ignoreboth  # пишем эту команду, вместо предыдущей, если в .bashrc уже содержит строчку export HISTCONTROL=ignoredups

###########
## color ##
###########

alias dmesg='dmesg --color=always'  # цветной вывод для команды "dmesg" (вывод буфера сообщений ядра в стандартный поток вывода)

alias pacman='pacman --color=always'  # цветной вывод для команды pacma

alias dir='dir --color=always'  # цветной вывод для команды dir (отображение папок в данной директории)

alias grep='grep --color=auto'  # цветной вывод для команды grep

alias ls='ls --color=auto'  # цветной вывод для команды ls

eval $(dircolors -b)  # улучшение цветного вывода ls; например, не работающие (сироты) симлинки будут отображаться красными оттенками

###########
##       ##
###########

alias sudo='sudo '  # если много псевдонимов, вы могли заметить, что они не переносятся в сеанс sudo

alias mkdir='mkdir -p -v'  # создание директории со вложенными директориями (-p). иначе будет сообщение об ошибке. Опция -v сделает команду говорливой.

alias mv=' timeout 8 mv -iv'  # приостановит mv, если он выполняется более 8-сек, будет спрашивать подтверждение на удалёние 3-х и более файлов, 
                              #...отображать список выполняемых операций и не хранить себя в файле истории shell
alias rm=' timeout 3 rm -Iv --one-file-system'  # алиас будет приостанавливать rm, если она выполняется более 3-сек, спрашивать подтверждение на удаление 3-х и более файлов, 
                              # отображать текущие операции, не давать возможность работать на более чем одной файловой системе 
alias rm=' timeout 3 rm -iv --one-file-system'  # тоже самое, только будет спрашивать подтверждение при удалении, даже для 1-го файла.

################
## less | vim ##
################

export PAGER='vimpager' # таким образом установим vim 
alias less=$PAGER       # в качестве альтер. просмоторщика

###########
## Other ##
###########

shopt -s autocd  # автоматическая смена директории (cd) при вводе только пути

shopt -s checkwinsize  # проверяет размер окна при вводе каждой команды и, если это необходимо, обновляет значения переменных LINES и COLUMNS.

################
## Извлечение ##
################

shopt -s extglob  # извлечение даных

#Эта функция позволяет извлекать данные из целого ряда различных типов архивов
extract() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
            *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
                   c=(bsdtar xvf);;
            *.7z)  c=(7z x);;
            *.Z)   c=(uncompress);;
            *.bz2) c=(bunzip2);;
            *.exe) c=(cabextract);;
            *.gz)  c=(gunzip);;
            *.rar) c=(unrar x);;
            *.xz)  c=(unxz);;
            *.zip) c=(unzip);;
            *)     echo "$0: unrecognized file extension: \`$i'" >&2
                   continue;;
        esac

        command "${c[@]}" "$i"
        ((e = e || $?))
    done
    return "$e"
}


#############
## CD + SL ##
#############

ls -hall --color=auto  # добавляем цвета

# целесообразно объединить cd и ls в одну команду. Запускаем командой "cl" 
cl() {
	local dir="$1"
	local dir="${dir:=$HOME}"
	if [[ -d "$dir" ]]; then
		cd "$dir" >/dev/null; ls
	else
		echo "bash: cl: $dir: Directory not found"
	fi
}


#############
## Заметки ##
#############

# простой способ сделать заметку. Пример команды "note summatelecom 167". Сохранится заметка в ~/.notes
note () {
    # if file doesn't exist, create it
    if [[ ! -f $HOME/.notes ]]; then
        touch "$HOME/.notes"
    fi

    if ! (($#)); then
        # no arguments, print file
        cat "$HOME/.notes"
    elif [[ "$1" == "-c" ]]; then
        # clear file
        printf "%s" > "$HOME/.notes"
    else
        # add all arguments to file
        printf "%s\n" "$*" >> "$HOME/.notes"
    fi
}


#############
## Ip info ##
#############

# полная инфо об ip-адресе и имени хоста. Команда запуска "ipif"
ipif() { 
    if grep -P "(([1-9]\d{0,2})\.){3}(?2)" <<< "$1"; then
	curl ipinfo.io/"$1"
    else
	ipawk=($(host "$1" | awk '/address/ { print $NF }'))
	curl ipinfo.io/${ipawk[1]}
    fi
    echo
}


#########
## PS1 ##
#########

# Вывод даты в терминале
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
 
PS1="$LINE_COLOR$LINE_CORNER_1$LINE_VERTICAL [\D{%d.%m.%Y %H:%M}]\[\e[m\] $USER_NAME $DIR_COLOR$DIR \n$LINE_COLOR$LINE_CORNER_2$LINE_VERTICAL $SYMBOL $INPUT_COLOR"

################
## ~/.inputrc ##
################

set echo-control-characters off  # отключение "^C в терминале"

"\e[A": history-search-backward  # начинаешь вводить команду, потом жмёшь стрелку вверх, 
"\e[B": history-search-forward  # и из истории подставляются ранее введённые команды


###############
## ~/.bashrc ##
###############

# Добавляем Отображение Даты и Времени в Bash History
export HISTTIMEFORMAT="%h %d %H:%M:%S "

# Увеличиваем Размер Хранимой Истории
export HISTFILESIZE=10000

# добавлять новые команды в файл с историей, а не переписывать его каждый раз
shopt -s histappend

# чтобы сохранять команды сразу после выполнения 
PROMPT_COMMAND='history -a' 

# Сохранять все строки многострочной команды в одной записи списка истории
shopt -s cmdhist