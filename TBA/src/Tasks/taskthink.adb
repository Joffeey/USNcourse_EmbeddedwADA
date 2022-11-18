With Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Radio; use MicroBit.Radio;
with MicroBit.Accelerometer;
with LSM303AGR; use LSM303AGR;
with HAL; use HAL;
with ControllerDrivingStates;
with nRF.Radio; use nRF.Radio;
with ada.Execution_Time; use ada.Execution_Time;
with Ada.Text_IO; use Ada.Text_IO;

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

      Time_Now_Stopwatch_Think : Time;
      Time_Now_CPU_Think : CPU_Time;
      Elapsed_Stopwatch_Think : Time_Span;
      Elapsed_CPU_Think : Time_Span;
      HighestCPU_Think : Time_Span;


   begin
      ManualControll := False;
      TurnCounter := 0;
      loop
         Time_Now_Stopwatch_Think := Clock;
         Time_Now_CPU_Think := Clock;
         --- EXECUTION ---
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

         Elapsed_CPU_Think := (Clock - Time_Now_CPU_Think);
         Elapsed_Stopwatch_Think :=  (Clock - Time_Now_Stopwatch_Think);
         if Elapsed_CPU_Think > HighestCPU_Think then
            HighestCPU_Think := Elapsed_CPU_Think;
            Put_Line ("Highest CPU time in THINK as of now: " & To_Duration (HighestCPU_Think)'Image & " seconds");
            Put_Line ("Stopwatch time in THINK while highest CPU: " & To_Duration (Elapsed_Stopwatch_Think)'Image & " seconds");
         end if;

         delay until myClock + Milliseconds(10);
      end loop;
   end think;


end TaskThink;
