# F1TENTH Mocap Data Recording Pipeline

| <img src="https://github.com/Tinker-Twins/F1TENTH-Mocap-Data-Recording-Pipeline/blob/main/Media/Motion%20Capture%20Area.png" width="500"> | <img src="https://github.com/Tinker-Twins/F1TENTH-Mocap-Data-Recording-Pipeline/blob/main/Media/Vehicle%20with%20Mocap%20Markers.JPG" width="500"> |
| :----------------------------------: | :----------------------------------------------------------------------------------: |
| OptiTrack Motion Capture Area | F1TENTH Vehicle with Mocap Markers |

## SETUP (Vehicle On-Board Computer)

1. Clone this repository.
    ```bash
    $ git clone https://github.com/Tinker-Twins/F1TENTH-Mocap-Data-Recording-Pipeline.git
    ```
2. Move the `autodrive` and `f1tenth` directories from the `Vehicle Software` directory to the source space (`src`) of the Catkin workspace on the vehicle computer.
    ```bash
    $ mv ~/Vehicle\ Software/autodrive ~/catkin_ws/src/
    $ mv ~/Vehicle\ Software/f1tenth ~/catkin_ws/src/
    ```
3. Build the packages.
    ```bash
    $ cd ~/catkin_ws
    $ catkin_make
    ```
4. Source the `setup.bash` and/or `.bashrc` as needed.
    ```bash
    $ source ~/catkin_ws/devel/setup.bash
    $ source ~/.bashrc
    ```

## SETUP (Remote PC Connected to OptiTrack MoCap System)

1. Install `mocap_optitrack` ROS package:
    ```bash
    $ sudo apt-get install ros-<distro>-mocap-optitrack
    ```
    **References:**  
    http://wiki.ros.org/mocap_optitrack  
    https://tuw-cpsg.github.io/tutorials/optitrack-and-ros/  

2. Source the `setup.bash` and/or `.bashrc` as needed.
    ```bash
    $ source /opt/ros/<distro>/setup.bash
    $ source ~/.bashrc
    ```

## USAGE

- **[Terminal Window 1] MoCap Bringup:** Launch the `mocap.launch` file from `mocap_optitrack` package on remote PC.
  ```bash
  $ roslaunch mocap_optitrack mocap.launch & rosrun rviz rviz
  ```

- **[Terminal Window 2] Open-Loop Control:** Launch the `open_loop_ctrl_autodrive.launch` file from `racecar` package on vehicle computer (SSH into vehicle computer).
  ```bash
  $ ssh ccri-car-1@192.168.2.103
  $ roslaunch racecar open_loop_ctrl_autodrive.launch
  ```

- **[Terminal Window 3] Data Recording:** Record contents of all topics to a bag file with a custom name.
  ```bash
  $ cd <path/to/directory/to/save/bag/file(s)>
  $ rosbag record -a -O <bag_file_name>.bag
  ```
