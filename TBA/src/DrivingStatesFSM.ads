with MyMotorDriver; use MyMotorDriver;

package DrivingStatesFSM is
   -- Defining all the driving states for the car
   type DrivState is (Stopping, DriveForward, Rleft, Rright, DriveBackward);
   
   protected States is
      -- Help functions to determin the driving state
      function CanMoveForward (SensorFront : Integer) return Boolean;
      function CanRotLeft (SensorLeft : Integer; SensorRight : Integer; SensorFront : Integer) return Boolean;
      function CanRotRight (SensorLeft : Integer; SensorRight : Integer; SensorFront : Integer) return Boolean;
      
      -- Updates the driving state based on the input from the distance sensors
      function UpdateState(SensorFront : Integer; SensorLeft : Integer; SensorRight : Integer) return DrivState;
      
      -- A cheeky procedure to help the car when it can't choose direction. This turns the car multiple
      -- times to the left, and hopefully places the car in a better position to make a decision on it's own.
      procedure Unstuck;
      
   end States;
   
end DrivingStatesFSM;
