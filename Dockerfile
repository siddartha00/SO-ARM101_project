FROM osrf/ros:jazzy-desktop-full

RUN apt-get update && apt-get install -y \
    python3-colcon-common-extensions \
    ros-jazzy-moveit\
    git \
    && rm -rf /var/lib/apt/lists/*

# Create a workspace
WORKDIR /ros2_ws
RUN mkdir /ros2_ws/src

# Automatically source ROS and your workspace in every new terminal
RUN echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc
RUN echo "if [ -f /ros2_ws/install/setup.bash ]; then source /ros2_ws/install/setup.bash; fi" >> ~/.bashrc

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]