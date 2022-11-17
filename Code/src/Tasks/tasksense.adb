With Ada.Real_Time; use Ada.Real_Time;
With Ultrasonic; -- use Ultrasonic;
with MicroBit.Radio;
with HAL; use HAL;
with MicroBit.Console; use MicroBit.Console;
with nRF.Radio;
use MicroBit;
package body TaskSense is

    task body sense is
      myClock : Time;
      RXdata : Radio.RadioData;
      package Ultrasonic1 is new Ultrasonic;
      package Ultrasonic2 is new Ultrasonic;
      package Ultrasonic3 is new Ultrasonic;
      
   begin
      Ultrasonic1.Setup(10,11);
      Ultrasonic2.Setup(5,19);
      Ultrasonic3.Setup(9,8);
      

      Radio.Setup(RadioFrequency => 2407,
               Length => 3+12,
               Version => 12,
               Group => 1,
               Protocol => 14);
      Radio.StartReceiving;
      Put_Line(Radio.State);
      loop
         myClock := Clock; 
         Brain.SetMeasurementSensor1(Integer(Ultrasonic1.Read));
         Brain.SetMeasurementSensor2(Integer(Ultrasonic2.Read));
         Brain.SetMeasurementSensor3(Integer(Ultrasonic3.Read));
            
         while Radio.DataReady loop
            Brain.SetMeasurementSensor4 (Radio.Receive); -- random value, hook up a sensor here!
         end loop;
         delay until myClock + Milliseconds(200); --random period
      end loop;
   end sense;

end TaskSense;
