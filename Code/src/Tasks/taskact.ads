with MyMotorDriver; use MyMotorDriver;

package TaskAct is

   task Act with Priority=> 2;

   procedure Setup;    
   procedure Drive (direction : Directions);
   procedure DriveWheel(w : Wheel);
end TaskAct;
