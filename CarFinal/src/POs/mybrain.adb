with MicroBit.Radio; use MicroBit.Radio;

package body MyBrain is

     
    protected body Brain is
      --  procedures can modify the data
      procedure SetMeasurementSensor1 (V : Integer) is
      begin
         MeasurementSensor1 := V;
      end SetMeasurementSensor1;

      --  functions cannot modify the data
      function GetMeasurementSensor1 return Integer is
      begin
         return MeasurementSensor1;
      end GetMeasurementSensor1;
      
      --  procedures can modify the data
      procedure SetMeasurementSensor2 (V : Integer) is
      begin
         MeasurementSensor2 := V;
      end SetMeasurementSensor2;

      --  functions cannot modify the data
      function GetMeasurementSensor2 return Integer is
      begin
         return MeasurementSensor2;
      end GetMeasurementSensor2;
      
      -- Adding an extra sensor with the same template as above
      procedure SetMeasurementSensor3 (V : Integer) is
      begin
         MeasurementSensor3 := V;
      end SetMeasurementSensor3;
      
      function GetMeasurementSensor3 return Integer is
      begin
         return MeasurementSensor3;
      end GetMeasurementSensor3;
      
      procedure SetRadioSensor (V : RadioData) is
      begin
         RadioSignal := V;
      end SetRadioSensor;
      
      function GetRadioSensor return RadioData is
      begin
         return RadioSignal;
      end GetRadioSensor;
      
      
   end Brain;

end MyBrain;
