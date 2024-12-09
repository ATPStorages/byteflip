with System; use System;

generic
   --  The type to operate on for bit flipping.
   type Modular_Type is mod <>;
package ByteFlip is
   --  Flips M's bytes (endian).
   procedure Flip_Bytes (M : in out Modular_Type);

   --  Flips M's bytes (endian) from Big Endian to Little Endian,
   --  IF the host machine is Little Endian.
   procedure Flip_Big_Endian_Bytes (M : in out Modular_Type);

   --  Flips M's bytes (endian) from Little Endian to Big Endian,
   --  IF the host machine is Big Endian.
   procedure Flip_Little_Endian_Bytes (M : in out Modular_Type);

   --  Flips M's bytes (endian) to Big/Little Endian,
   --  depending on the host machine's endian and ForBigEndian.
   procedure Flip_Specified_Endian_Bytes (M : in out Modular_Type; Flip_To : Bit_Order);
end ByteFlip;
