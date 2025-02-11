#!/bin/bash

# Source the ROS setup
source /opt/ros/noetic/setup.bash

# Set the parameter
Turtle_No=${1:-1}
ROS_MASTER_IP=${2:-$(hostname -I | awk '{print $1}')}
ROS_IP=${3:-$ROS_MASTER_IP}

# Pull the latest updates from the repositories
cd /root/catkin_ws/src
if [ -d "tb_cbf" ]; then
    cd tb_cbf && git pull && cd ..
else
    git clone https://github.com/viswans2132/tb_cbf.git
fi

# Build the workspace
cd /root/catkin_ws/
catkin_make

# Source the workspace
source /root/catkin_ws/devel/setup.bash

# Export ROS_MASTER_URI and ROS_IP
export ROS_MASTER_URI=http://"$ROS_MASTER_IP":11311
export ROS_IP="$ROS_IP"

# Execute the provided command
roslaunch tb_cbf tro_docker_tb_cont.launch namespace:="demo_turtle"$Turtle_No""
