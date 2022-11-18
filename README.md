# TBA
## General 
Git repository createad for the Real-time system subject at the University of South-Eastern Norway with the task of creating a real-time system ourselves. Our goal was to create a self-driving mecaunm car that would never crash and could also be remote controlled. Our system would detect the objects that may come in the way by using ultrasonic sensores and making a decision based on their data. 

### Components 
This are the components we have used to achive our goals:
- Mecanum car
- 2 x Micro:bit v2 
- 4 x Dc motors
- 2 x Motor drivers (L298N)
- Micro:bit GPIO Board
- Breadboard 
- Wires
- Battery pack, 4 x AA batteries

## Code 
- Capital letter for the first letter in each word
- Lowercase letters for remaining characters
- Variable and function names in PascalCase
- The specification file should include a summary of what the package does and what functions it consits of
- Assign unique and descriptive variables names

## Structure 
The program is designed with three different tasks:
1. Sense 
2. Think
3. Act

We have implemented two Finite State Machines in our task captured in the images below. The image below contains the Finite State Machine diagram for when the car is remote controlled. 
![FSMD Remote](https://user-images.githubusercontent.com/71882170/202713124-6c5260a2-1fd9-4d98-b5ca-45639be11564.png)
The image below contains the Finite State Machine diagram for when the car is in autonomous driving. 
![FSMD Autonomous](https://user-images.githubusercontent.com/71882170/202713153-0b65d389-335c-4917-99d8-62cce276c20d.png)
The image below contains a diagram that illustrates how we switch between the Finite State Machines with the help of the second Micro:bit
![Controller diagram](https://user-images.githubusercontent.com/71882170/202712847-7c4a4300-f5ed-4e31-912a-e912c42836a8.png)
