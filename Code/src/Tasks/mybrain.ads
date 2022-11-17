with MicroBit.Radio;
with HAL; use HAL;
with MicroBit.Console; use MicroBit.Console;
with nRF.Radio;
use MicroBit;
package MyBrain is

   protected Brain is
      function GetMeasurementSensor1 return Integer; -- concurrent read operations are now possible
      function GetMeasurementSensor2 return Integer; -- concurrent read operations are now possible
      function GetMeasurementSensor3 return Integer; -- concurrent read operations are now possible
      function GetMeasurementSensor4 return Radio.RadioData; -- concurrent read operations are now possible
      
      procedure SetMeasurementSensor1 (V : Integer); -- but concurrent read/write are not!
      procedure SetMeasurementSensor2 (V : Integer); -- but concurrent read/write are not!
      procedure SetMeasurementSensor3 (V : Integer); -- but concurrent read/write are not!
      procedure SetMeasurementSensor4 (V : Radio.RadioData); -- but concurrent read/write are not!
   private
         MeasurementSensor1 : Integer := 0;
         MeasurementSensor2 : Integer := 0;
         MeasurementSensor3 : Integer := 0;
         RXdata1 : Radio.RadioData;
   end Brain;

end MyBrain;
