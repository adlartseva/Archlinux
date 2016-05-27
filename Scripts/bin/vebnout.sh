#!/bin/bash
#запись с веб-камеры себя (в левой нижнем углу экрана) (с вебки ноутбука)
mplayer -tv driver=v4l2:width=320:height=240: -vo xv tv:// -geometry "99%:90%" -noborder -ontop