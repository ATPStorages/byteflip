pragma Ada_2022;

with Ada.Unchecked_Conversion;

with Ada.Text_IO;

package body ByteFlip is

   procedure Flip_Bytes (M : in out Modular_Type) is

      type Modular_String is new String (1 .. M'Size / 8);
      function Modular_To_String is new Ada.Unchecked_Conversion (Modular_Type, Modular_String);
      function String_To_Modular is new Ada.Unchecked_Conversion (Modular_String, Modular_Type);
      I, S : Modular_String;

   begin
      S := Modular_To_String (M);

      if Modular_Type'Size = 16 then
         I (2) := S (1);
         I (1) := S (2);

      elsif Modular_Type'Size = 24 then
         I (3) := S (1);
         I (2) := S (2);
         I (1) := S (3);

      else
         raise Tasking_Error with "Oops";
      end if;
      M := String_To_Modular (I);
   end Flip_Bytes;

   procedure Flip_Big_Endian_Bytes (M : in out Modular_Type) is
   begin
      if Default_Bit_Order = Low_Order_First then
         Flip_Bytes (M);
      end if;
   end Flip_Big_Endian_Bytes;

   procedure Flip_Little_Endian_Bytes (M : in out Modular_Type) is
   begin
      if Default_Bit_Order = High_Order_First then
         Flip_Bytes (M);
      end if;
   end Flip_Little_Endian_Bytes;

   procedure Flip_Specified_Endian_Bytes (M : in out Modular_Type; Flip_To : Bit_Order) is
   begin
      if Flip_To = Low_Order_First then
         Flip_Big_Endian_Bytes (M);

      else
         Flip_Little_Endian_Bytes (M);
      end if;
   end Flip_Specified_Endian_Bytes;

end ByteFlip;
