package body ControllerDrivingStates is

   function ControllUpdateState (V : RadioData) return DrivState is
      X,Y,Z : Axis_Data;
      Threshold : constant := 150;
   begin
      X:= LSM303AGR.Convert(V.Payload(1), V.Payload(2)) * Axis_Data (-1);
      Y:= LSM303AGR.Convert(V.Payload(3), V.Payload(4));
      Z:= LSM303AGR.Convert(V.Payload(5), V.Payload(6));
      
      if X > Threshold then
         return Rleft;
      elsif X < -Threshold then
         return Rright;
      elsif Y > Threshold then
         return DriveForward;
      elsif Y < -Threshold then
         return DriveBackward;
      else
         return Stopping;
      end if;
   end ControllUpdateState;
   
      

end ControllerDrivingStates;
