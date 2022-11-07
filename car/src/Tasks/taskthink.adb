With Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO;

package body TaskThink is

  task body think is
      myClock : Time;
      FrontSens : Integer; -- Front sensor
      LeftSens : Integer; -- Left sensor
      RightSens : Integer; -- Right sensor
   begin
      loop
         myClock := Clock;
         FrontSens := Brain.GetMeasurementSensor1;
         LeftSens := Brain.GetMeasurementSensor2;
         RightSens := Brain.GetMeasurementSensor3;
         
         --make a decision (could be wrapped nicely in a procedure)
         if FrontSens > 15 then
            MotorDriver.SetDirection (Forward); --our decision what to do based on the sensor values
         
         elsif FrontSens < 14 and LeftSens < RightSens then
            MotorDriver.SetDirection (Stop);
            while FrontSens < 30 loop
               MotorDriver.SetDirection (RotateRight);
               FrontSens := Brain.GetMeasurementSensor1;
               myClock := Clock;
               Ada.Text_IO.Put_Line(Integer'Image (FrontSens));
               delay until myClock + Milliseconds(30);
            end loop;
             
            
         elsif FrontSens < 14 and LeftSens > RightSens then
            MotorDriver.SetDirection (Stop);
            while FrontSens < 30 loop
               MotorDriver.SetDirection (RotateLeft);
               FrontSens := Brain.GetMeasurementSensor1;
               myClock := Clock;
               Ada.Text_IO.Put_Line(Integer'Image (FrontSens));
               delay until myClock + Milliseconds(30);
            end loop;
            --MotorDriver.SetDirection (Forward);
         else
            MotorDriver.SetDirection (Stop);
         end if;
         
                  
         delay until myClock + Milliseconds(20);  --random period
         
      end loop;
   end think;


end TaskThink;
