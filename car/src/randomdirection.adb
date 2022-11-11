package body RandomDirection is

   function GetRandomDirection(V : Choice ) return Directions is
   
   begin
      return
        (case V is
            when 1 => RotateLeft,
            when 2 => RotateRight);
      
   end GetRandomDirection;
      

end RandomDirection;
