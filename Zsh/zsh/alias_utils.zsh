## alias_utils
## Alies-color
alias grep='grep --color=auto'  # цветной греп
alias ls='ls --color=auto'
alias la='ls -la --color=auto'
## global
alias g='| grep'
alias l='| less'
##
alias h="history"
alias rb="sudo reboot"
alias pof="sudo poweroff"
alias modprobe='sudo modprobe'
alias mount='sudo mount'
alias sudo='sudo '  # если много псевдонимов, вы могли заметить, что они не переносятся в сеанс sudo
alias cp='cp -r'
alias mkdir='mkdir -p -v'  # создание директории со вложенными директориями (-p). иначе будет сообщение об ошибке. Опция -v сделает команду говорливой.
# удаление с подтверждением
alias rm='nocorrect rm -i'
# переименование-перемещение c пogтвepжgeнueм
alias mv='nocorrect mv -i'
# systemctl
start() { sudo systemctl start $1; }
stop() { sudo systemctl stop $1; }
restart() { sudo systemctl restart $1; }
status() { sudo systemctl status $1; }
enabled() { sudo systemctl enable $1; listd; }
disabled() { sudo systemctl disable $1; listd; }

Start() { sudo systemctl start $1; sudo systemctl status $1; }
Stop() { sudo systemctl stop $1; sudo systemctl status $1; }
Restart() { sudo systemctl restart $1; sudo systemctl status $1; }
