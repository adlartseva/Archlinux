#!/bin/bash
#запись себя со сторонней вебки
mplayer -tv driver=v4l2:width=320:height=240:device=/dev/video1 -vo xv tv:// -geometry "99%:90%" -noborder -ontop