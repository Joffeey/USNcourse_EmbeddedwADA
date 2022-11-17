with MicroBit.Radio; use MicroBit.Radio;
with MicroBit.Accelerometer;
with LSM303AGR; use LSM303AGR;
with HAL; use HAL;
with DrivingStates; use DrivingStates;

package ControllerDrivingStates is

   function ControllUpdateState (V : RadioData) return DrivState;

end ControllerDrivingStates;
