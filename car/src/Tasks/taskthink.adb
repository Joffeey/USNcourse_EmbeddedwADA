With Ada.Real_Time; use Ada.Real_Time;
with RandomDirection; use RandomDirection;
with Ada.Numerics.Discrete_Random;
with Ada.Text_IO; use Ada.Text_IO;

package body TaskThink is

   task body think is
      -- declaring varius types and packages for making random direction choices
      type RandChoice is new Choice range 1..2;
      package RandomChoice is new ada.Numerics.Discrete_Random(RandChoice);
      use RandomChoice;
      type Index is range 1..10;
      type ChoiceArr is array (Index) of RandChoice;
      -- -----------------------------------------------------------------------
      myClock : Time;
      -- TimeStopped : Time;
      FrontSens : Integer; -- Front sensor
      LeftSens : Integer; -- Left sensor
      RightSens : Integer; -- Right sensor
      FrontMinDis : Integer; -- Controll minimal distance to the front sensor
      MinDis : Integer; -- Controlling minimal distance to break loop while turning.
      IsRotating : Boolean; -- Making sure FrontMinDis is not interfering with MinDis while turning.
      
      gen : Generator;
      tempChoice : RandChoice;
      NewRandomDirection : Directions;
      DirectionsArray : ChoiceArr;
      i : Index := 1;
      
      
   begin
      IsRotating := False;
      FrontMinDis := 20;
      MinDis := 50;
      
      for I in Index loop
         reset(gen);
         tempChoice := Random(gen);
         DirectionsArray(I) := tempChoice;
         Put_Line(tempChoice'Image);
      end loop;
      
      loop
         myClock := Clock;
         FrontSens := Brain.GetMeasurementSensor1;
         LeftSens := Brain.GetMeasurementSensor2;
         RightSens := Brain.GetMeasurementSensor3;
         
         
         if FrontSens > FrontMinDis and not IsRotating then
            MotorDriver.SetDirection (Forward);
         
         elsif FrontSens < FrontMinDis - 1 and LeftSens < RightSens then
            MotorDriver.SetDirection (Stop);
            IsRotating := True;
            while FrontSens < MinDis loop
               MotorDriver.SetDirection (RotateRight);
               FrontSens := Brain.GetMeasurementSensor1;
               myClock := Clock;
               
               delay until myClock + Milliseconds(15);
            end loop;
            IsRotating := False;
            
         elsif FrontSens < FrontMinDis - 1 and LeftSens > RightSens then
            MotorDriver.SetDirection (Stop);
            IsRotating := True;
            while FrontSens < MinDis loop
               MotorDriver.SetDirection (RotateLeft);
               FrontSens := Brain.GetMeasurementSensor1;
               myClock := Clock;
               
               delay until myClock + Milliseconds(15);
            end loop;
            IsRotating := False;
            
         --elsif LeftSens + RightSens / 2 >= 175 and TimeStopped >= TimeStopped + Milliseconds(10) then
         --   NewRandomDirection := GetRandomDirection(DirectionsArray(i));
         --   IsRotating := True;
         --   while FrontSens < MinDis loop
         --      MotorDriver.SetDirection (NewRandomDirection);
         --      FrontSens := Brain.GetMeasurementSensor1;
         --      myClock := myClock;
               
         --      delay until myClock + Milliseconds(15);
         --   end loop;
         --   IsRotating := False;
         --   i := i+1;
        
         else
            MotorDriver.SetDirection (Stop);
            --TimeStopped := Clock;
         end if;
         
                  
         delay until myClock + Milliseconds(20); 
         
      end loop;
   end think;


end TaskThink;
