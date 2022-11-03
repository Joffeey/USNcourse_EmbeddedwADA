With Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO;

package body TaskThink is

  task body think is
   myClock : Time;
   begin
      loop
         myClock := Clock;
        
         --make a decision (could be wrapped nicely in a procedure)
         if Brain.GetMeasurementSensor1 > 15 then
            Ada.Text_IO.Put_Line("Oppfylles dette");
            MotorDriver.SetDirection (Forward); --our decision what to do based on the sensor values        
         else
            MotorDriver.SetDirection (Stop); 
         end if;
         
         delay until myClock + Milliseconds(100);  --random period
      end loop;
   end think;


end TaskThink;
