with MyMotorDriver; use MyMotorDriver;

package RandomDirection is

   type Choice is range 1 .. 2;

   function GetRandomDirection(V : Choice) return Directions; --- Gives the motorcontroller a random direction

end RandomDirection;
