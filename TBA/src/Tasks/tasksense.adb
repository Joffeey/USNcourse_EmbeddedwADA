With Ada.Real_Time; use Ada.Real_Time;
With Ultrasonic; -- use Ultrasonic;
with Ada.Execution_Time; use Ada.Execution_Time;
with Ada.Text_IO; use Ada.Text_IO;
package body TaskSense is

    task body sense is
      myClock : Time;
      package Ultrasonic1 is new Ultrasonic;
      package Ultrasonic2 is new Ultrasonic;
      package Ultrasonic3 is new Ultrasonic;
      
      Time_Now_Stopwatch_Sense : Time;
      Time_Now_CPU_Sense : CPU_Time;
      Elapsed_Stopwatch_Sense : Time_Span;
      Elapsed_CPU_Sense : Time_Span;
      HighestCPU_Sense : Time_Span;
      
   begin
      Ultrasonic1.Setup(10,11);
      Ultrasonic2.Setup(5,19);
      Ultrasonic3.Setup(9,8);
      loop
         Time_Now_Stopwatch_Sense := Clock;
         Time_Now_CPU_Sense := Clock;
         --- EXECUTION -----
         
         myClock := Clock; 
         Brain.SetMeasurementSensor1(Integer(Ultrasonic1.Read));
         Brain.SetMeasurementSensor2(Integer(Ultrasonic2.Read));
         Brain.SetMeasurementSensor3(Integer(Ultrasonic3.Read));
         
         Elapsed_CPU_Sense := (Clock - Time_Now_CPU_Sense);
         Elapsed_Stopwatch_Sense :=  (Clock - Time_Now_Stopwatch_Sense);
         if Elapsed_CPU_Sense > HighestCPU_Sense then
            HighestCPU_Sense := Elapsed_CPU_Sense;
            Put_Line ("Highest CPU time in SENSE as of now: " & To_Duration (HighestCPU_Sense)'Image & " seconds");
            Put_Line ("Stopwatch time in SENSE while highest CPU: " & To_Duration (Elapsed_Stopwatch_Sense)'Image & " seconds");
         end if;
         
         delay until myClock + Milliseconds(150); --random period
      end loop;
   end sense;

end TaskSense;
