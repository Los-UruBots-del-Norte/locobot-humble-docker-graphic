# Comands to Run Simulation

# Build Docker image
```
./build.sh
```
# Run Container
```
./run.sh
```
## Gazebo models
Run this command before run simulation
```
source /usr/share/gazebo/setup.bash
```
# Access to the UI
Go to http://localhost:6080 and enter the user and password as mypasswd

# How to run simulation with graphics.
Check the run.sh file and change the conditional to validate the graphic card.

## Run Locobot
```
ros2 launch interbotix_xslocobot_sim xslocobot_gz_classic.launch.py robot_model:=locobot_px100 use_base:=true use_camera:=true use_lidar:=true base_type:=create3
```

## Execute base movements
```
ros2 topic pub -r 10 /locobot/diffdrive_controller/cmd_vel_unstamped geometry_msgs/msg/Twist '{linear:  {x: 0.1, y: 0.0, z: 0.0}, angular: {x: 0.0,y: 0.0,z: 0.0}}'
```