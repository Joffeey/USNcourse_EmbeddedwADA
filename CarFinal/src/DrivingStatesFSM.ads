with MyMotorDriver; use MyMotorDriver;

package DrivingStatesFSM is
   type DrivState is (Stopping, DriveForward, Rleft, Rright, DriveBackward);
   
   protected States is
      
      function CanMoveForward (SensorFront : Integer) return Boolean;
      function CanRotLeft (SensorLeft : Integer; SensorRight : Integer; SensorFront : Integer) return Boolean;
      function CanRotRight (SensorLeft : Integer; SensorRight : Integer; SensorFront : Integer) return Boolean;
      
      function UpdateState(SensorFront : Integer; SensorLeft : Integer; SensorRight : Integer) return DrivState;
      
      procedure Unstuck;
      
   end States;
   
end DrivingStatesFSM;
