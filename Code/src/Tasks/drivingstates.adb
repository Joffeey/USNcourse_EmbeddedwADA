package body DrivingStates is

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
      
         
      
      function UpdateState(SensorFront : Integer; SensorLeft : Integer; SensorRight : Integer; Controller : Boolean) return DrivState is
      begin
         if CanMoveForward(SensorFront) then
            return DriveForward;
         elsif CanRotLeft(SensorLeft, SensorRight, SensorFront) then
            return Rleft;
         elsif CanRotRight(SensorLeft, SensorRight, SensorFront) then
            return Rright;
         elsif Controller = True then 
            return Controll;
         else
            return Stopping;
         end if;
      end UpdateState;
      
         
      
   end States;
   
   
end DrivingStates;
