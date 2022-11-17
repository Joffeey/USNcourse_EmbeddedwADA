With Ada.Real_Time; use Ada.Real_Time;
with RandomDirection; use RandomDirection;
with Ada.Numerics.Discrete_Random;
with Ada.Text_IO; use Ada.Text_IO;
with MicroBit.Radio;
with HAL; use HAL;
with MicroBit.Console; use MicroBit.Console;
with nRF.Radio;
use MicroBit;
with MicroBit.DisplayRT;
with MicroBit.DisplayRT.Symbols;
with MicroBit.Accelerometer;
with LSM303AGR; use LSM303AGR;
package body TaskThink is

   task body think is
      -- declaring varius types and packages for making random direction choices
     -- type RandChoice is new Choice range 1..2;
     -- package RandomChoice is new ada.Numerics.Discrete_Random(RandChoice);
     -- use RandomChoice;
     -- type Index is range 1..10;
     -- type ChoiceArr is array (Index) of RandChoice;
      -- -----------------------------------------------------------------------
      myClock : Time;
      -- TimeStopped : Time;
      FrontSens : Integer; -- Front sensor
      LeftSens : Integer; -- Left sensor
      RightSens : Integer; -- Right sensor
      Controller : Boolean; 
      --FrontMinDis : Integer; -- Controll minimal distance to the front sensor
      --MinDis : Integer; -- Controlling minimal distance to break loop while turning.
      -- IsRotating : Boolean; -- Making sure FrontMinDis is not interfering with MinDis while turning.
      CurrentState : DrivState := Stopping;      
      -- gen : Generator;
      --tempChoice : RandChoice;
      --NewRandomDirection : Directions;
      --DirectionsArray : ChoiceArr;
      --i : Index := 1;
       RXdata : Radio.RadioData;
      Threshold : constant := 150;
      X,Y,Z : Axis_Data;
   begin
      -- IsRotating := False;
      loop
         myClock := Clock;
         FrontSens := Brain.GetMeasurementSensor1;
         LeftSens := Brain.GetMeasurementSensor2;
         RightSens := Brain.GetMeasurementSensor3;
         RXdata:= Brain.GetMeasurementSensor4;
         Controller := True;
         
                   
         
            X:= LSM303AGR.Convert(RXdata.Payload(1), RXdata.Payload(2)) * Axis_Data (-1);
            Y:= LSM303AGR.Convert(RXdata.Payload(3), RXdata.Payload(4));
            Z:= LSM303AGR.Convert(RXdata.Payload(5), RXdata.Payload(6));
         
         
           CurrentState := States.UpdateState(FrontSens, LeftSens, RightSens, Controller);
         
         --Put_Line(CurrentState'Image);
         
         case CurrentState is
            when DriveForward => MotorDriver.SetDirection (Forward);
            when Rleft => MotorDriver.SetDirection (RotateLeft);  
            when Rright =>MotorDriver.SetDirection (RotateRight);
            when Stopping => MotorDriver.SetDirection (Stop);
            when Controll => 
               if X > Threshold then
                --  MicroBit.DisplayRT.Symbols.Left_Arrow;
                  MotorDriver.SetDirection (RotateLeft);
         
            elsif X < -Threshold then
                --  MicroBit.DisplayRT.Symbols.Right_Arrow;
                  MotorDriver.SetDirection (RotateRight);
         
            elsif Y > Threshold then
                   MotorDriver.SetDirection (Forward);
                 --  DisplayRT.Symbols.Up_Arrow;
        
            else
               --MicroBit.DisplayRT.Symbols.Heart;
               MotorDriver.SetDirection (Stop);
            end if;
         end case;

        
          delay until Clock + Milliseconds(100);
      end loop;
   end think;


end TaskThink;
