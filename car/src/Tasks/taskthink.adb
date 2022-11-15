With Ada.Real_Time; use Ada.Real_Time;
with RandomDirection; use RandomDirection;
with Ada.Numerics.Discrete_Random;
with Ada.Text_IO; use Ada.Text_IO;


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
      --FrontMinDis : Integer; -- Controll minimal distance to the front sensor
      --MinDis : Integer; -- Controlling minimal distance to break loop while turning.
      -- IsRotating : Boolean; -- Making sure FrontMinDis is not interfering with MinDis while turning.
      CurrentState : DrivState := Stopping;
      CanForward : Boolean;
      CanLeft : Boolean;
      CanRight : Boolean;
      --CanTurnRight : Boolean;
      
      -- gen : Generator;
      --tempChoice : RandChoice;
      --NewRandomDirection : Directions;
      --DirectionsArray : ChoiceArr;
      --i : Index := 1;
      
      
   begin
      -- IsRotating := False;
      loop
         myClock := Clock;
         FrontSens := Brain.GetMeasurementSensor1;
         LeftSens := Brain.GetMeasurementSensor2;
         RightSens := Brain.GetMeasurementSensor3;
         

         CanForward := States.CanMoveForward(CurrentState, FrontSens);
         CanLeft := States.CanRotLeft(CurrentState, LeftSens, RightSens, FrontSens);
         CanRight := States.CanRotRight(CurrentState, LeftSens, RightSens, FrontSens);
         --CanTurnRight := States.CanTurnRight(CurrentState, LeftSens, RightSens, FrontSens);
         
         CurrentState := States.SetState(CanForward, CanLeft, CanRight);
         
         Put_Line(FrontSens'Image);
         
         case CurrentState is
            when DriveForward => MotorDriver.SetDirection (Forward);
            when Rleft => MotorDriver.SetDirection (RotateLeft);
            when Rright => MotorDriver.SetDirection (RotateRight);
            --when TurningRight => MotorDriver.SetDirection (TurnRight);
            when Stopping => MotorDriver.SetDirection (Stop);
         end case;
         
                  
         delay until myClock + Milliseconds(20); 
         
      end loop;
   end think;


end TaskThink;
