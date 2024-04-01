#!/bin/sh
# If NVIDIA card is present, run with GPU support
# If NVIDIA card is not present, run without GPU support
os=$(uname)
if [[ $os == "Linux" ]]; then
   echo "Running on Linux"
   gpu=$(lspci | grep -i '.* vga .* nvidia .*')
   if [[ $gpu == *' nvidia '* ]]; then
      echo "NVIDIA card found"
      docker run --gpus 0 -it --shm-size=1024m -e SIZEW=1920 -e SIZEH=1080 -e PASSWD=mypasswd -e BASIC_AUTH_PASSWORD=mypasswd -e NOVNC_ENABLE=true -p 6080:8080 ros2-humble-locobots-graphics:latest
   else
      echo "No NVIDIA card found"
      docker run -it --shm-size=1024m -e SIZEW=1920 -e SIZEH=1080 -e PASSWD=mypasswd -e BASIC_AUTH_PASSWORD=mypasswd -e NOVNC_ENABLE=true -p 6080:8080 ros2-humble-locobots-graphics:latest
   fi
elif [[ $os == "Darwin" ]]; then
   echo "Running on macOS"
   if system_profiler SPDisplaysDataType | grep -i "NVIDIA"; then
      echo "NVIDIA card found"
      docker run --gpus 0 -it --shm-size=1024m -e SIZEW=1920 -e SIZEH=1080 -e PASSWD=mypasswd -e BASIC_AUTH_PASSWORD=mypasswd -e NOVNC_ENABLE=true -p 6080:8080 ros2-humble-locobots-graphics:latest
   else
      echo "No NVIDIA card found"
      docker run -it --shm-size=1024m -e SIZEW=1920 -e SIZEH=1080 -e PASSWD=mypasswd -e BASIC_AUTH_PASSWORD=mypasswd -e NOVNC_ENABLE=true -p 6080:8080 ros2-humble-locobots-graphics:latest
   fi
fi

