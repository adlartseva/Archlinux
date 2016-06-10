# alias -s
# опрделяем формат -> программа
# быстрый запуск из консоли (просто набери имя файла!)
# с помощью "nohup ristretto" программа не убьется при закрытиии терминала
alias -s {avi,mpeg,mpg,mov,m2v,mkv}=vlc
alias -s {jpg,jpeg,png,svg,eps}=ristretto
alias -s {mp3,flac}=qmmp
alias -s {odt,doc,xls,ppt,docx,xlsx,pptx,csv}=libreoffice
alias -s {pdf,djvu,djv}=qpdfview
autoload -U pick-web-browser
alias -s {html,htm}=firefox
