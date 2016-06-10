## левая строка
# host >
PROMPT="%{$fg_bold[green]%}%m %{$reset_color%}\
%{$fg_bold[yellow]%}% > "
## правая строка
# [time] | user
RPROMPT="%{$fg_bold[yellow]%}[%T]%{$reset_color%}\
%{$fg_bold[green]%} | %1/%{$reset_color%}"