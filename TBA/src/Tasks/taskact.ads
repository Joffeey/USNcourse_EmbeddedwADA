with MyMotorDriver; use MyMotorDriver;

package TaskAct is

   task Act with Priority=> 2;

   procedure SetupMotors;    
   procedure Drive (direction : Directions);
   procedure ControlMotor(Instruction : DriveInstruction; Pins : MotorControllerPins);
   
end TaskAct;
