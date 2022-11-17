With Ada.Real_Time; use Ada.Real_Time;
with RandomDirection; use RandomDirection;
with Ada.Numerics.Discrete_Random;
with Ada.Text_IO; use Ada.Text_IO;
with MicroBit.Radio; use MicroBit.Radio;
with MicroBit.Accelerometer;
with LSM303AGR; use LSM303AGR;
with HAL; use HAL;
with ControllerDrivingStates;


package body TaskThink is

   task body think is
      myClock : Time;
      FrontSens : Integer; -- Front sensor
      LeftSens : Integer; -- Left sensor
      RightSens : Integer; -- Right sensor
      RadioSensor : RadioData; -- Wierless sensor
      CurrentState : DrivState := Stopping;
      ManualControll : Boolean;
   begin
      ManualControll := False;
      loop
         myClock := Clock;
         FrontSens := Brain.GetMeasurementSensor1;
         LeftSens := Brain.GetMeasurementSensor2;
         RightSens := Brain.GetMeasurementSensor3;
         RadioSensor := Brain.GetRadioSensor;
         
         if RadioSensor.Payload(12) = 2#001# and ManualControll = False then
            ManualControll := True;
         end if;
         if RadioSensor.Payload(12) = 2#010# and ManualControll = True then
            ManualControll := False;
         end if;        
         
         if ManualControll = True then
             
            CurrentState := ControllerDrivingStates.ControllUpdateState(RadioSensor);
         
            case CurrentState is
               when DriveForward => MotorDriver.SetDirection (Forward);
               when Rleft => MotorDriver.SetDirection (RotateLeft);
               when Rright => MotorDriver.SetDirection (RotateRight);
               when DriveBackward => MotorDriver.SetDirection (Backward);
               when Stopping => MotorDriver.SetDirection (Stop);
            end case;
         else
            CurrentState := States.UpdateState(FrontSens, LeftSens, RightSens);
            
            case CurrentState is
               when DriveForward => MotorDriver.SetDirection (Forward);
               when Rleft => MotorDriver.SetDirection (RotateLeft);
               when Rright => MotorDriver.SetDirection (RotateRight);
               when Stopping => MotorDriver.SetDirection (Stop);
               when DriveBackward => MotorDriver.SetDirection (Backward);
            end case;
            
            if CurrentState 
            
         end if;
         
         
                  
         delay until myClock + Milliseconds(10); 
         
      end loop;
   end think;


end TaskThink;
