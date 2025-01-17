with Ada.Streams;
with System;

generic
   type T is private;

   use Ada.Streams;
   use System;
package Byteflipper_Generics is
   pragma Pure;

   generic
      type E is private;
      Endian : System.Bit_Order;
   procedure Read_Integer
     (Stream : not null access Root_Stream_Type'Class; Item : out E);

   generic
      type E is private;
      Endian : System.Bit_Order;
   procedure Write_Integer
     (Stream : not null access Root_Stream_Type'Class; Item : E);

   --  Little Endian

   type Little_Endian is new T;

   procedure Read_Little_Endian
     (Stream : not null access Root_Stream_Type'Class;
      Item   : out Little_Endian);
   procedure Write_Little_Endian
     (Stream : not null access Root_Stream_Type'Class; Item : Little_Endian);

   for Little_Endian'Read use Read_Little_Endian;
   for Little_Endian'Write use Write_Little_Endian;

   --  Big Endian

   type Big_Endian is new T;

   procedure Read_Big_Endian
     (Stream : not null access Root_Stream_Type'Class; Item : out Big_Endian);
   procedure Write_Big_Endian
     (Stream : not null access Root_Stream_Type'Class; Item : Big_Endian);

   for Big_Endian'Read use Read_Big_Endian;
   for Big_Endian'Write use Write_Big_Endian;
end Byteflipper_Generics;
