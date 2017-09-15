#!/bin/bash
#!/usr/bin/env python
#-*- coding:utf-8 -*-

#killall -9 rosmaster &
#roscore &
#gnome-terminal -x bash -c "./test.sh" &
source devel/setup.bash &
gnome-terminal -t "demo_launch" -x bash -c "source devel/setup.bash;roslaunch move_group move_part.launch;exec bash;" &
sleep 1
gnome-terminal -t "graspit_launch" -x bash -c "source devel/setup.bash;roslaunch move_group graspit_part.launch;exec bash;" &
sleep 1
gnome-terminal -t "move_group" -x bash -c "source devel/setup.bash;rosrun move_group move_group_node;exec bash;" &
sleep 1
gnome-terminal -t "graspit" -x bash -c "source devel/setup.bash;rosrun graspit_ros_planning graspit_ac.py;exec bash;" &
exit 0
