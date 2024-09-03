#!/bin/bash
set -e

# Source the ROS setup
source /opt/ros/noetic/setup.bash

# Pull the latest updates from the repositories
cd /root/catkin_ws/src
if [ -d "tb_cbf" ]; then
    cd tb_cbf && git pull && cd ..
else
    git clone git@github.com:viswans2132/tb_cbf.git
fi

if [ -d "libviconstream" ]; then
    cd libviconstream && git pull && cd ..
else
    git clone git@github.com:LTU-RAI/libviconstream.git
fi

if [ -d "ros_viconstream" ]; then
    cd ros_viconstream && git pull && cd ..
else
    git clone git@github.com:LTU-RAI/ros_viconstream.git
fi

# Build the workspace
cd /root/catkin_ws/
catkin_make

# Source the workspace
source /root/catkin_ws/devel/setup.bash

# Execute the provided command
exec "$@"
