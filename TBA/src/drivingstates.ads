with MyBrain; use MyBrain;
with MyMotorDriver; use MyMotorDriver;

package DrivingStates is
   type DrivState is (Stopping, DriveForward, Rleft, Rright);
   
   protected States is
      
      function CanMoveForward (CurrState : DrivState; SensorFront : Integer) return Boolean;
      function CanRotLeft (CurrState : DrivState; SensorLeft : Integer; SensorRight : Integer; SensorFront : Integer) return Boolean;
      function CanRotRight (CurrState : DrivState; SensorLeft : Integer; SensorRight : Integer; SensorFront : Integer) return Boolean;
      
      function SetState(ForwardTrue : Boolean; RotLeft : Boolean; RotRight : Boolean) return DrivState;
      -- procedure GetState(DriveState : State);
      
   end States;
   
end DrivingStates;
