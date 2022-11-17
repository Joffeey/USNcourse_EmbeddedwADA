with MicroBit.Radio; use MicroBit.Radio;
with HAL; use HAL;
with nRF.Radio;

package MyBrain is
   
   protected Brain is
      
      function GetMeasurementSensor1 return Integer; -- concurrent read operations are now possible
      function GetMeasurementSensor2 return Integer; -- concurrent read operations are now possible
      function GetMeasurementSensor3 return Integer; -- concurrent read operations are now possible
      function GetRadioSensor return RadioData;
      
      
      procedure SetMeasurementSensor1 (V : Integer); -- but concurrent read/write are not!
      procedure SetMeasurementSensor2 (V : Integer); -- but concurrent read/write are not!
      procedure SetMeasurementSensor3 (V : Integer); -- but concurrent read/write are not!
      procedure SetRadioSensor (V : RadioData);
      
            
   private
         MeasurementSensor1 : Integer := 0;
         MeasurementSensor2 : Integer := 0;
         MeasurementSensor3 : Integer := 0;
         RadioSignal : RadioData;
         
   end Brain;

end MyBrain;
