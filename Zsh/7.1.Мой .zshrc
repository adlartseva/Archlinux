################
## Мой .zshrc ##
################

# autocd
setopt autocd
## Отключение звукового сигнала
## при ошибках
unsetopt beep
# включаем калькулятор
autoload zcalc
# автоматически log в 10 * 60 сек бездействия
export TMOUT=600
# Установка атрибутов доступа для вновь создаваемых файлов
umask 022

# Редактор и пейджер
export EDITOR="vim"
export PAGER="vimpager"
# цветной gcc
export GCC_COLOR="auto"

cl() { cd "$1" && ls }  # cd + ls



# Загрузка пользовательских настроек от $HOME/.zsh
if [[ -a ${HOME}/.zsh-plugins ]]; then   # список плагинов
    for _SRC in $(cat "${HOME}/.zsh-plugins"); do source "${HOME}/.zsh/${_SRC}"; done   # путь до плагинов
fi