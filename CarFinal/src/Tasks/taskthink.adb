With Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Radio; use MicroBit.Radio;
with MicroBit.Accelerometer;
with LSM303AGR; use LSM303AGR;
with HAL; use HAL;
with ControllerDrivingStates;
with nRF.Radio; use nRF.Radio;


package body TaskThink is

   task body think is
      myClock : Time;
      FrontSens : Integer; -- Front sensor
      LeftSens : Integer; -- Left sensor
      RightSens : Integer; -- Right sensor
      RadioSensor : RadioData; -- Wierless sensor
      CurrentState : DrivState := Stopping;
      ManualControll : Boolean;
      TurnCounter : Integer;
   begin
      ManualControll := False;
      TurnCounter := 0;
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
            
            if CurrentState = Rleft or CurrentState = Rright then
               TurnCounter := TurnCounter + 1;
            else
               TurnCounter := 0;
            end if;
            
            if TurnCounter > 100 then
               States.Unstuck;

            end if;
            
         end if;
         
         delay until myClock + Milliseconds(10); 
         
      end loop;
   end think;


end TaskThink;
