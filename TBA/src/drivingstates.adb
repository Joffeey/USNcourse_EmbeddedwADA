package body DrivingStates is

   protected body States is
   
      function CanMoveForward (CurrState : DrivState; SensorFront : Integer) return Boolean is
      begin
         if SensorFront > 25 then
            return True;
         else
            return False;
         end if;
      end CanMoveForward;
      
      function CanRotLeft (CurrState : DrivState; SensorLeft : Integer; SensorRight : Integer; SensorFront : Integer) return Boolean is
      begin
         if SensorLeft > SensorRight then
            return True;
         else
            return False;
         end if;
      end CanRotLeft;
      
      function CanRotRight (CurrState : DrivState; SensorLeft : Integer; SensorRight : Integer; SensorFront : Integer) return Boolean is
      begin
         if SensorRight > SensorLeft then
            return True;
         else
            return False;
         end if;
      end CanRotRight;
      
         
      
      function SetState(ForwardTrue : Boolean; RotLeft : Boolean; RotRight : Boolean) return DrivState is
      begin
         if ForwardTrue then
            return DriveForward;                
         elsif RotLeft then
            return Rleft;
         elsif RotRight then
            return Rright;
         else 
            return Stopping;
         end if;
      end SetState;
      
   end States;
   
   
end DrivingStates;
