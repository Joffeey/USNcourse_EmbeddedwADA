with MicroBit.Radio; use MicroBit.Radio;
with MicroBit.Accelerometer;
with LSM303AGR; use LSM303AGR;
with HAL; use HAL;

-- Package to set up the wireless controller, using the example provided in class as a template.
-- Doing this reduce text and to increase readability in the Sense task.

package WirelessRadio is

   procedure SetupRadio;
   procedure EnableReceiving;

end WirelessRadio;
