With MicroBit.IOsForTasking; use MicroBit.IOsForTasking;

package MyMotorDriver is

   type Directions is (Forward, Stop, RotateRight, RotateLeft, Backward);
   
   type DriveInstruction is record
           LeftFrontSpeed: Analog_Value;
           LeftFrontPin1 : Boolean;
           LeftFrontPin2 : Boolean;
           LeftBackSpeed : Analog_Value;
           LeftBackPin1 : Boolean;
           LeftBackPin2 : Boolean;
      
           RightFrontSpeed : Analog_Value;
           RightFrontPin1 : Boolean;
           RightFrontPin2 : Boolean;
           RightBackSpeed : Analog_Value;
           RightBackPin1 : Boolean;
           RightBackPin2 : Boolean;
   end record;
   
   type MotorControllerPins is record
           LeftFrontSpeedEnA : Pin_Id;
           LeftFrontPin1In1 : Pin_Id;
           LeftFrontPin2In2 : Pin_Id;
           LeftBackSpeedEnB : Pin_Id;
           LeftBackPin1In3 : Pin_Id;
           LeftBackPin2In4 : Pin_Id;
                          
           RightFrontSpeedEnA : Pin_Id;
           RightFrontPin1In1 : Pin_Id;
           RightFrontPin2In2 : Pin_Id;
           RightBackSpeedEnB : Pin_Id;
           RightBackPin1In3 : Pin_Id;
           RightBackPin2In4 : Pin_Id;
   end record;
       
   protected MotorDriver is
 
      function GetDirection return Directions;
      function GetMotorPins return MotorControllerPins;

      procedure SetMotorPins (V : MotorControllerPins);
      procedure SetDirection (V : Directions);
   private
      DriveDirection : Directions := Stop;
      Pins : MotorControllerPins;
   end MotorDriver;

end MyMotorDriver;
