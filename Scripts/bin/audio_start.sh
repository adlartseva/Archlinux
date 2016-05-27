#!/bin/bash 
touch ~/.pll.sh; 
echo "#!/bin/bash" > ~/.pll.sh; echo "mpg321 ~/.mustart/* & sleep 10 && killall mpg321" >> ~/.pll.sh; chmod u+x ~/.pll.sh 
mkdir ~/.mustart ; ln -s ~/.mustart ~/Меняем\ музыку\ при\ входе; thunar ~/.mustart; 
echo "~/.pll.sh &" >> ~/.profile