with System; use System;
with Interfaces; use Interfaces;

package body ByteFlip is
   Full_Byte : constant Unsigned_128 := 16#FF#;
   Type_Offset_One_Byte   : constant Natural := Modular_Type'Size - 8;
   Type_Offset_Size_Bytes : constant Natural := Type_Offset_One_Byte / 8;
   Type_Size_Bytes_Half   : constant Natural := Modular_Type'Size / 16;

   procedure FlipBytes (M : in out Modular_Type) is
      N         : Modular_Type := 0;
      H         : constant Unsigned_128 := Unsigned_128 (M);
      Extracted : Unsigned_128;
      To_Move   : Natural;
   begin
      for Byte in 0 .. Type_Offset_Size_Bytes loop
         Extracted := H and Shift_Left (Full_Byte, Byte * 8);
         To_Move   := 16 * (Byte rem Type_Size_Bytes_Half);

         N := N or (if Byte > Type_Size_Bytes_Half - 1 then
            Modular_Type (Shift_Right (Extracted, 8 + To_Move))
         else
            Modular_Type (Shift_Left (Extracted,
                                      Type_Offset_One_Byte - To_Move)));
      end loop;
      M := N;
   end FlipBytes;

   procedure FlipBytesBE (M : in out Modular_Type) is
   begin
      if Default_Bit_Order = Low_Order_First then
         FlipBytes (M);
      end if;
   end FlipBytesBE;

   procedure FlipBytesLE (M : in out Modular_Type) is
   begin
      if Default_Bit_Order = High_Order_First then
         FlipBytes (M);
      end if;
   end FlipBytesLE;

   procedure FlipBytesCHK (M : in out Modular_Type; ForBigEndian : Boolean) is
   begin
      if ForBigEndian then
         FlipBytesBE (M);
      else
         FlipBytesLE (M);
      end if;
   end FlipBytesCHK;
end ByteFlip;
