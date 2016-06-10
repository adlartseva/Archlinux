## BindKey
# комбинации клавиш
bindkey '^[[A'  up-line-or-search               # стрелка вверх для задней истории-поиска
bindkey '^[[B'  down-line-or-search             # стрелка вниз для FWD-истории-поиска
bindkey '^[[H' beginning-of-line               # home
bindkey '\e[2~' overwrite-mode                  # insert
bindkey '\e[3~' delete-char                     # del
bindkey '^[[F' end-of-line                     # end
bindkey '\e[5~' up-line-or-history              # page-up
bindkey '\e[6~' down-line-or-history            # page-down