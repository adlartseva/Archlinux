# после установки, программа была видна в автокомплите: pacman, yaourt and pacaur
pacman() {
  /usr/bin/sudo /usr/bin/pacman $* && echo "$*" | grep -q "S\|R\|U" && rehash
}
yaourt() {
  /usr/bin/yaourt $* && echo "$*" | grep -q "S\|R\|U" && rehash
}
pacaur () {
  /usr/bin/pacaur $* && echo "$*" | grep -q "S\|R\|U" && rehash
}