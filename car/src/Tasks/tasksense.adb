With Ada.Real_Time; use Ada.Real_Time;
With Ultrasonic; -- use Ultrasonic;
package body TaskSense is

    task body sense is
      myClock : Time;
      package Ultrasonic1 is new Ultrasonic;
      package Ultrasonic2 is new Ultrasonic;
      package Ultrasonic3 is new Ultrasonic;
      
   begin
      Ultrasonic1.Setup(10,11);
      Ultrasonic2.Setup(5,19);
      Ultrasonic3.Setup(9,8);
      loop
         myClock := Clock; 
         Brain.SetMeasurementSensor1(Integer(Ultrasonic1.Read));
         Brain.SetMeasurementSensor2(Integer(Ultrasonic2.Read));
         Brain.SetMeasurementSensor3(Integer(Ultrasonic3.Read));
            
         delay until myClock + Milliseconds(200); --random period
      end loop;
   end sense;

end TaskSense;
