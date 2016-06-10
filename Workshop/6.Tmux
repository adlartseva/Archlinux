####################
## Tmux - утилита ##
####################

$ sudo pacman -S tmux  # установим пакет

$ cp /usr/share/tmux/example_tmux.conf ~/.tmux.conf  # скопируем конфиг по умолчанию

# по умолчанию главная клавиша Ctrl-B

#########################
## Стандартные клавиши ##
#########################


Ctrl-b %  (Разделить окно вертикально)
Ctrl-b "  “split-window” (Разделить окно горизонтально)
Ctrl-b o или Ctrl-b Tab (Перейти к следующей панели)
Ctrl-b {  (Переместить текущую панель влево)
Ctrl-b }  (Переместить текущую панель вправо)

Ctrl-b c  создать новое окно 
Ctrl-b ,.  переименовать текущее окно — введите новое имя и нажмите Enter
Ctrl-b l (Переход предыдущему окну)
Ctrl-b w (Список всех окон с нумерацией)
Ctrl-b <window number> (Перемещение по указанному номеру окна, по умолчанию в диапазоне от 0 до 9)
Ctrl-b q  (Показать номера панелей; перейти в область по нажатии клавиши, соответствующей номеру)

Ctrl-b f <window name> (Поиск по названию окна)
Ctrl-b w (Выбор окна из интерактивного списка)

#######################

$ tmux attach  # вернуть tmux на родину

$ tmux ls  # вывод всех сессий

$ tmux attach -t 1  # подключение к конкретной сессии

#######################
## Смена гл. клавиши ##
######################

$ nano $HOME/.tmux.conf  # отредактируем конфиг

unbind C-b
set -g prefix C-a
bind C-a send-prefix

###############
## Настройки ##
###############

# возможность скроллинга до 10000 строк
set -g history-limit 10000  

# режим копирования на клавиши "esc
unbind [
bind Escape copy-mode"

# Переместить буфер обмена tmux в буфер обмена X
bind-key C-y save-buffer /tmp/tmux-buffer \; run-shell "cat /tmp/tmux-buffer | xclip"

# Часы, вызываемые Ctrl-b t:
set-window-option -g clock-mode-colour cyan
set-window-option -g clock-mode-style 24

# Отключить визуальную активность
set -g visual-activity off
set -g visual-bell off

# Заголовок окна
set-option -g set-titles on
set-option -g set-titles-string '#S:#I.#P #W' # window number,program name,active (or not)
set-window-option -g automatic-rename on # auto name

# сообщения
#set-window-option -g mode-bg magenta
#set-window-option -g mode-fg black
#set-option -g message-bg magenta
#set-option -g message-fg black

# панель состояния
set-option -g status-utf8 on
set-option -g status-justify right
set-option -g status-bg black
set-option -g status-fg cyan
set-option -g status-interval 5
set-option -g status-left-length 30
set-option -g status-left '#[fg=magenta]» #[fg=blue,bold]#T#[default]'
set-option -g status-right '#[fg=cyan]»» #[fg=blue,bold]###S #[fg=magenta]%R %m-%d#(acpi | cut -d ',' -f 2)#[default]'
set-option -g visual-activity on
set-window-option -g monitor-activity on
set-window-option -g window-status-current-fg white

################
## Автозапуск ##
################

$ sudo nano /etc/systemd/system/tmux@.service  # создадим службу

		[Unit]
		Description=Start tmux in detached session

		[Service]
		Type=forking
		User=%I
		ExecStart=/usr/bin/tmux new-session -s %u -d
		ExecStop=/usr/bin/tmux kill-session -t %u

		[Install]
		WantedBy=multi-user.target

$ sudo nano ~/.config/systemd/user/tmux.service  # если разместить этот файл в домашней директории, то tmux запуститься сразу после входа в систему

###########################
## Инициализация сеансов ##
###########################

# запустить сеанс с разделенными окнами

	new  -s SessionName -n WindowName Command
	neww -n foo/bar foo
	splitw -v -p 50 -t 0 bar
	selectw -t 1 
	selectp -t 0

## Чтобы управлять несколькими сеансами, подключайте раздельные файлы сеансов в конфигурационном файле: ##

# инициализация сеансов
bind F source-file ~/.tmux/foo
bind B source-file ~/.tmux/bar


#####################
## Статус бар Tmux ##
#####################

#(shell-command) - Любая внешняя команда
#[attributes] - Изменение цвета, или атрибута статус бара
#H - Имя хоста локального компьютера
#F - Текущий флаг окна
#I - номер текущего (активного) окна
#P - Список всех фреймов
#S - Имя сессии
#T - Заголовок текущего окна
#W - Имя текущего окна
## - Символ решётка - ‘#’

# Пример #
#Для левой части задётся зелёный цвет, имя хоста и значение по умолчанию. Для правой жёлтый цвет, внешняя команда с аргументами, снова значение по умолчанию, и время в собственном формате с помощью внешней команды date. В примере комбинируются собственные спец. символами, с теми, что по умолчанию.

set -g status-left '#[fg=green]#H#[default]' #
set -g status-right '#[fg=yellow]#(cut -d " " -f 1-4 /proc/loadavg)#[default] #[fg=cyan,bold]%Y-%m-%d %H:%M:%S#[default]' #

