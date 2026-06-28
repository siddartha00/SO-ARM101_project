FROM osrf/ros:jazzy-desktop-full

RUN apt-get update && apt-get install -y \
    python3-colcon-common-extensions \
    ros-jazzy-moveit\
    ros-jazzy-ros2-control\
    ros-jazzy-ros2-controllers\
    git \
    && rm -rf /var/lib/apt/lists/*

# Create a workspace
WORKDIR /ros2_ws

# Automatically source ROS and your workspace in every new terminal
RUN echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc
RUN echo "if [ -f /ros2_ws/install/setup.bash ]; then source /ros2_ws/install/setup.bash; fi" >> ~/.bashrc

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]