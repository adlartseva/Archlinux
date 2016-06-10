## alias_user
alias top='htop'  # замена top на htop
## program
alias tm="tmux"
alias svim='sudo vim'
# сборная солянка
alias psync='pacaur -Syy'  # полное обновление базы данных пакетов
alias paco='sudo pacaur -Sc && sudo pacman-optimize'   # удаление из кэша всех неустановленных пакетов и неиспользуемых репозиториев
alias q='exit'   # выход
alias yrt='pacaur -y'   # тут все ясно
alias led='leafpad ~/.bashrc'  # открыть bashrc
alias zsu='source ~/.zshrc'   # для вступления в силу изменений
alias pconf='sudo leafpad /etc/pacman.conf'  # открыть pacman.conf
alias pcf='profile-cleaner f'  # очистить кэш firefox
alias pcg='profile-cleaner gc'  # очистить кэш chrome
alias md='sudo updatedb'  # обновить базу mlocate
alias lcp='sudo localepurge'  # для удаления ненужных локализаций
alias lcc='sudo /usr/bin/localepurge-config'  # обновить конфиг
alias ac='aria2c'  # скачать что-либо
alias speed='speedtest-cli'    # проверка скорости интернета
alias subl='subl3'  # открыть sublime text
alias music='ncmpcpp'  # клиент для mpd
alias wttr='alias wttr='wget -O - wttr.in/"Rostov-on-don" -q''  # для wego (wttr.in)
# pacaur aliases
alias pac="/usr/bin/pacaur -S"   # установить один или несколько пакетов из оф. репозиториев
alias pacu="/usr/bin/pacaur -Syu"  # обновить все пакеты по pacman и aur
alias pacr="/usr/bin/pacaur -Rns"  # удалить один или несколько пакетов
alias pacs="/usr/bin/pacaur -Ss"    # поиск пакета с одним и более слов
alias paci="/usr/bin/pacaur -Si"    # показать инфо о пакете
alias paclo="/usr/bin/pacaur-Qdt"    # список пакетов, которые являются осиротевшими (не требуются, как зависимости)
alias pacc="/usr/bin/pacaur -Scc"  # полностью очитить кэш
# удалить все осиротевшиее пакеты
alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rns \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"
## папки
alias docs='cd ~/Документы/'
alias down='cd ~/Загрузки/'