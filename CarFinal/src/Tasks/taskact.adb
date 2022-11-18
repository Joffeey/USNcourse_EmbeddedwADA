With Ada.Real_Time; use Ada.Real_Time;
With MicroBit.Console; use MicroBit.Console;
With MicroBit.IOsForTasking; use MicroBit.IOsForTasking;

package body TaskAct is

   task body act is
      myClock : Time;
      CurrentDirection : Directions;
   begin
      
      SetupMotors;
      
      loop
         myClock := Clock;
         CurrentDirection := MotorDriver.GetDirection;
         
         Drive(CurrentDirection);
         
         delay until myClock + Milliseconds(20);
      end loop;
      
   end act;
   
   procedure SetupMotors is
      Pins : MotorControllerPins;
      
   begin
      Pins.LeftFrontSpeedEnA := 0;
      Pins.LeftFrontPin1In1 := 6;
      Pins.LeftFrontPin2In2 := 7;
      Pins.LeftBackSpeedEnB := 0;
      Pins.LeftBackPin1In3 := 2;
      Pins.LeftBackPin2In4 := 3;
        
      Pins.RightFrontSpeedEnA := 1;
      Pins.RightFrontPin1In1 := 12;
      Pins.RightFrontPin2In2 := 13;
      Pins.RightBackSpeedEnB := 1;
      Pins.RightBackPin1In3 := 14;
      Pins.RightBackPin2In4 := 15;
      
      MotorDriver.SetMotorPins(Pins);
      
      Set_Analog_Period_Us (20_000);
     
      null;
   end;
      
   procedure Drive(Direction : Directions) is
      Instruction : DriveInstruction;
      RightSpeed : Analog_Value := 512; -- a value between 0 and 1023
      LeftSpeed : Analog_Value := 550; -- a value between 0 and 1023
   begin
      case Direction is 
         when Forward => 
            Instruction.LeftFrontSpeed := LeftSpeed; 
            Instruction.LeftFrontPin1 := True;
            Instruction.LeftFrontPin2 := not Instruction.LeftFrontPin1;
            Instruction.LeftBackSpeed := LeftSpeed;  
            Instruction.LeftBackPin1 := True;
            Instruction.LeftBackPin2 := not Instruction.LeftBackPin1;
           
            Instruction.RightFrontSpeed := RightSpeed; 
            Instruction.RightFrontPin1 := True;
            Instruction.RightFrontPin2 := not Instruction.RightFrontPin1; 
            Instruction.RightBackSpeed := RightSpeed;
            Instruction.RightBackPin1 := True;
            Instruction.RightBackPin2 := not Instruction.RightBackPin1;

         when Stop => 
            Instruction.LeftFrontSpeed := 0;
            Instruction.LeftFrontPin1 := False;
            Instruction.LeftFrontPin2 := False;
            Instruction.LeftBackSpeed := 0;
            Instruction.LeftBackPin1 := False;
            Instruction.LeftBackPin2 := False;
            
            Instruction.RightFrontSpeed := 0;
            Instruction.RightFrontPin1 := False;
            Instruction.RightFrontPin2 := False; 
            Instruction.RightBackSpeed := 0;
            Instruction.RightBackPin1 := False;
            Instruction.RightBackPin2 := False;
            
         when RotateRight =>
            Instruction.LeftFrontSpeed := LeftSpeed;
            Instruction.LeftFrontPin1 := True;
            Instruction.LeftFrontPin2 := False; 
            Instruction.LeftBackSpeed := LeftSpeed;
            Instruction.LeftBackPin1 := True;
            Instruction.LeftBackPin2 := False;
            
            Instruction.RightFrontSpeed := RightSpeed;
            Instruction.RightFrontPin1 := False;
            Instruction.RightFrontPin2 := True; 
            Instruction.RightBackSpeed := RightSpeed;
            Instruction.RightBackPin1 := False;
            Instruction.RightBackPin2 := True;
            
         when RotateLeft =>
            Instruction.LeftFrontSpeed := LeftSpeed;
            Instruction.LeftFrontPin1 := False;
            Instruction.LeftFrontPin2 := True; 
            Instruction.LeftBackSpeed := LeftSpeed;
            Instruction.LeftBackPin1 := False;
            Instruction.LeftBackPin2 := True;
            
            Instruction.RightFrontSpeed := RightSpeed;
            Instruction.RightFrontPin1 := True;
            Instruction.RightFrontPin2 := False; 
            Instruction.RightBackSpeed := RightSpeed;
            Instruction.RightBackPin1 := True;
            Instruction.RightBackPin2 := False;
            
         when Backward =>
            Instruction.LeftFrontSpeed := LeftSpeed; 
            Instruction.LeftFrontPin1 := False;
            Instruction.LeftFrontPin2 := not Instruction.LeftFrontPin1; 
            Instruction.LeftBackSpeed := LeftSpeed;  
            Instruction.LeftBackPin1 := False;
            Instruction.LeftBackPin2 := not Instruction.LeftBackPin1;
           
            Instruction.RightFrontSpeed := RightSpeed;  
            Instruction.RightFrontPin1 := False;
            Instruction.RightFrontPin2 := not Instruction.RightFrontPin1; 
            Instruction.RightBackSpeed := RightSpeed;
            Instruction.RightBackPin1 := False;
            Instruction.RightBackPin2 := not Instruction.RightBackPin1;
            
        end case;
      
        ControlMotor(Instruction, MotorDriver.GetMotorPins);
            
      end Drive;
   
   procedure ControlMotor(Instruction : DriveInstruction; Pins: MotorControllerPins) is
        
      begin
         --LEFT
         --front   
         MicroBit.IOsForTasking.Set(Pins.LeftFrontPin1In1, Instruction.LeftFrontPin1); --IN1
         MicroBit.IOsForTasking.Set(Pins.LeftFrontPin2In2, Instruction.LeftFrontPin2); --IN2
   
         --back
         MicroBit.IOsForTasking.Set(Pins.LeftBackPin1In3, Instruction.LeftBackPin1); --IN3
         MicroBit.IOsForTasking.Set(Pins.LeftBackPin2In4, Instruction.LeftBackPin2); --IN4
   
         --RIGHT
         --front
         MicroBit.IOsForTasking.Set(Pins.RightFrontPin1In1, Instruction.RightFrontPin1); --IN1
         MicroBit.IOsForTasking.Set(Pins.RightFrontPin2In2, Instruction.RightFrontPin2); --IN2

         --back
         MicroBit.IOsForTasking.Set(Pins.RightBackPin1In3, Instruction.RightBackPin1); --IN3
         MicroBit.IOsForTasking.Set(Pins.RightBackPin2In4, Instruction.RightBackPin2); --IN4
      
         --speed 
         MicroBit.IOsForTasking.Write (Pins.LeftFrontSpeedEnA, Instruction.LeftFrontSpeed); --left speed control ENA ENB 
         MicroBit.IOsForTasking.Write (Pins.RightFrontSpeedEnA, Instruction.RightFrontSpeed); --right speed control ENA ENB
      
   end ControlMotor;
   
end TaskAct;
