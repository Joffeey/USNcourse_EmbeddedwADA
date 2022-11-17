with MicroBit.Radio; use MicroBit.Radio;
with MicroBit.Accelerometer;
with LSM303AGR; use LSM303AGR;
with HAL; use HAL;

package body WirelessRadio is

   procedure SetupRadio is
   begin
      Setup(RadioFrequency => 2407,
            Length => 3+12,
            Version => 12,
            Group => 1,
            Protocol => 14);
   end SetupRadio;
   
   procedure EnableReceiving is
   begin
      StartReceiving;
   end EnableReceiving;
   

end WirelessRadio;
