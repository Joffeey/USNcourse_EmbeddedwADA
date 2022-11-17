with MyBrain; use MyBrain;
with MyMotorDriver; use MyMotorDriver;

package DrivingStates is
   type DrivState is (Stopping, DriveForward, Rleft, Rright, Controll);
   
   protected States is
      
      function CanMoveForward (SensorFront : Integer) return Boolean;
      function CanRotLeft (SensorLeft : Integer; SensorRight : Integer; SensorFront : Integer) return Boolean;
      function CanRotRight (SensorLeft : Integer; SensorRight : Integer; SensorFront : Integer) return Boolean;
      
      function UpdateState(SensorFront : Integer; SensorLeft : Integer; SensorRight : Integer; Controller : Boolean) return DrivState;
     --  procedure GetState(DriveState : State);
      
   end States;
   
end DrivingStates;
