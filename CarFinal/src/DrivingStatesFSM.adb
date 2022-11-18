package body DrivingStatesFSM is

   protected body States is
   
      function CanMoveForward (SensorFront : Integer) return Boolean is
      begin
         if SensorFront >= 25 then
            return True;
         else
            return False;
         end if;
      end CanMoveForward;
      
      function CanRotLeft (SensorLeft : Integer; SensorRight : Integer; SensorFront : Integer) return Boolean is
      begin
         if SensorFront < 25 and SensorLeft > SensorRight then
            return True;
         else
            return False;
         end if;
      end CanRotLeft;
      
      function CanRotRight (SensorLeft : Integer; SensorRight : Integer; SensorFront : Integer) return Boolean is
      begin
         if SensorFront < 25 and SensorRight > SensorLeft then
            return True;
         else
            return False;
         end if;
      end CanRotRight;
      
         
      
      function UpdateState(SensorFront : Integer; SensorLeft : Integer; SensorRight : Integer) return DrivState is
      begin
         if CanMoveForward(SensorFront) then
            return DriveForward;
         elsif CanRotLeft(SensorLeft, SensorRight, SensorFront) then
            return Rleft;
         elsif CanRotRight(SensorLeft, SensorRight, SensorFront) then
            return Rright;
         else
            return Stopping;
         end if;
      end UpdateState;
      
      procedure Unstuck is
      begin
         MotorDriver.SetDirection (RotateLeft);
         MotorDriver.SetDirection (RotateLeft);
         MotorDriver.SetDirection (RotateLeft);
         MotorDriver.SetDirection (RotateLeft);
         MotorDriver.SetDirection (RotateLeft);
         MotorDriver.SetDirection (RotateLeft);
         MotorDriver.SetDirection (RotateLeft);
         MotorDriver.SetDirection (RotateLeft);
      end Unstuck;
      
   end States;
   
   
end DrivingStatesFSM;
