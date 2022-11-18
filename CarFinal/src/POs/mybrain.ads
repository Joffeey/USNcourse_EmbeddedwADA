with MicroBit.Radio; use MicroBit.Radio;
with HAL; use HAL;
with nRF.Radio;

package MyBrain is
   
   protected Brain is
      -- Setting up all of our sensors
      function GetMeasurementSensor1 return Integer;
      function GetMeasurementSensor2 return Integer;
      function GetMeasurementSensor3 return Integer;
      function GetRadioSensor return RadioData;
      
      procedure SetMeasurementSensor1 (V : Integer);
      procedure SetMeasurementSensor2 (V : Integer);
      procedure SetMeasurementSensor3 (V : Integer);
      procedure SetRadioSensor (V : RadioData);
      
   private
         MeasurementSensor1 : Integer := 0;
         MeasurementSensor2 : Integer := 0;
         MeasurementSensor3 : Integer := 0;
         RadioSignal : RadioData;
   end Brain;

end MyBrain;
