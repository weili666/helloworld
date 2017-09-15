#!/bin/bash

#killall -9 rosmaster &
#roscore &
#gnome-terminal -x bash -c "./test.sh" &
source devel/setup.bash &
gnome-terminal -t "pointgrey_camera_launch" -x bash -c "source devel/setup.bash; roslaunch pointgrey_camera_driver camera.launch ;exec bash;" &
sleep 1
gnome-terminal -t "image_echo" -x bash -c "source devel/setup.bash;rosrun rqt_image_view rqt_image_view;exec bash;" &
sleep 1
exit 0
