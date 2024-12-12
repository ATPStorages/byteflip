with Ada.Unchecked_Conversion;

package body Byteflipper_Generics is
   ----------------------
   -- R/W Raw Integers --
   ----------------------

   type Discrete_String is new String (1 .. T'Size / 8);

   procedure Read_Integer (Stream : not null access Root_Stream_Type'Class; Item : out E) is
      function String_To_E is new Ada.Unchecked_Conversion (Discrete_String, E);
      String_Read : Discrete_String;
   begin
      Discrete_String'Read (Stream, String_Read);
      if Endian /= Default_Bit_Order then
         String_Read := (for C of reverse String_Read => C);
      end if;
      Item := String_To_E (String_Read);
   end Read_Integer;

   procedure Write_Integer (Stream : not null access Root_Stream_Type'Class; Item : E) is
      function E_To_String is new Ada.Unchecked_Conversion (E, Discrete_String);
      As_String : Discrete_String := E_To_String (Item);
   begin
      if Endian /= Default_Bit_Order then
         As_String := (for C of reverse As_String => C);
      end if;
      Discrete_String'Write (Stream, As_String);
   end Write_Integer;

      --  Little Endian

   procedure Read_Little_Endian (Stream : not null access Root_Stream_Type'Class; Item : out Little_Endian) is

      procedure Read is new Read_Integer (Little_Endian, Low_Order_First);

   begin
      Read (Stream, Item);
   end Read_Little_Endian;

   procedure Write_Little_Endian (Stream : not null access Root_Stream_Type'Class; Item : Little_Endian) is

      procedure Write is new Write_Integer (Little_Endian, Low_Order_First);

   begin
      Write (Stream, Item);
   end Write_Little_Endian;

      --  Big Endian

   procedure Read_Big_Endian (Stream : not null access Root_Stream_Type'Class; Item : out Big_Endian) is

      procedure Read is new Read_Integer (Big_Endian, High_Order_First);

   begin
      Read (Stream, Item);
   end Read_Big_Endian;

   procedure Write_Big_Endian (Stream : not null access Root_Stream_Type'Class; Item : Big_Endian) is

      procedure Write is new Write_Integer (Big_Endian, High_Order_First);

   begin
      Write (Stream, Item);
   end Write_Big_Endian;

end Byteflipper_Generics;