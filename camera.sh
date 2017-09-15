#!/bin/bash

#killall -9 rosmaster &
#roscore &
#gnome-terminal -x bash -c "./test.sh" &
source devel/setup.bash &
gnome-terminal -t "openni_launch" -x bash -c "source devel/setup.bash;roslaunch openni2_launch openni2.launch camera:=xtion ;exec bash;" &
sleep 1
gnome-terminal -t "evaluate_grasps" -x bash -c "source devel/setup.bash;rosrun heightimage_grasp_planning evaluateGrasps.py;exec bash;" &
sleep 1
gnome-terminal -t "grasp_plan_server" -x bash -c "source devel/setup.bash;rosrun heightimage_grasp_planning heightimage_graspplanning_server_node;exec bash;" &
sleep 1
gnome-terminal -t "table segmentation" -x bash -c "source devel/setup.bash;rosrun tabletop_segmentation tabletop_segmentation;exec bash;" &
sleep 1
gnome-terminal -t "grasp_plan_client" -x bash -c "source devel/setup.bash;rosrun heightimage_grasp_planning heightimage_graspplanning_client_node ;exec bash;" &
exit 0
