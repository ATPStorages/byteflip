with Byteflipper_Generics;

package Byteflippers is
   pragma Pure;

     ------------
     -- 8 Bits --
     ------------

   type Unsigned_8 is mod 2**8 with
     Size => 8;
   pragma Provide_Shift_Operators (Unsigned_8);

   type Signed_8 is range -(2**7) .. (2**7) - 1 with
     Size => 8;
   pragma Provide_Shift_Operators (Signed_8);

     -------------
     -- 16 Bits --
     -------------

   type Unsigned_16 is mod 2**16 with
     Size => 16;
   pragma Provide_Shift_Operators (Unsigned_16);

   package Endians_Unsigned_16 is new Byteflipper_Generics (Unsigned_16);

   type Signed_16 is range -(2**15) .. (2**15) - 1 with
     Size => 16;
   pragma Provide_Shift_Operators (Signed_16);

   package Endians_Signed_16 is new Byteflipper_Generics (Signed_16);

     -----------------------------------------------------
     -- 24 Bits                                         --
     -- Shift operators are not available for this type --
     -----------------------------------------------------

   type Unsigned_24 is mod 2**24 with
     Size => 24;

   package Endians_Unsigned_24 is new Byteflipper_Generics (Unsigned_24);

   type Signed_24 is range -(2**23) .. (2**23) - 1 with
     Size => 24;

   package Endians_Signed_24 is new Byteflipper_Generics (Signed_24);

     -------------
     -- 32 Bits --
     -------------

   type Unsigned_32 is mod 2**32 with
     Size => 32;
   pragma Provide_Shift_Operators (Unsigned_32);

   package Endians_Unsigned_32 is new Byteflipper_Generics (Unsigned_32);

   type Signed_32 is range -(2**31) .. (2**31) - 1 with
     Size => 32;
   pragma Provide_Shift_Operators (Signed_32);

   package Endians_Signed_32 is new Byteflipper_Generics (Signed_32);

   type Float_32 is digits 6 with Size => 32;

   package Endians_Float_32 is new Byteflipper_Generics (Float_32);

     -------------
     -- 64 Bits --
     -------------

   type Unsigned_64 is mod 2**64 with
     Size => 64;
   pragma Provide_Shift_Operators (Unsigned_64);

   package Endians_Unsigned_64 is new Byteflipper_Generics (Unsigned_64);

   type Signed_64 is range -(2**63) .. (2**63) - 1 with
     Size => 64;
   pragma Provide_Shift_Operators (Signed_64);

   package Endians_Signed_64 is new Byteflipper_Generics (Signed_64);

   type Float_64 is digits 15 with Size => 64;

   package Endians_Float_64 is new Byteflipper_Generics (Float_64);

     --------------
     -- 128 Bits --
     --------------

   type Unsigned_128 is mod 2**128 with
     Size => 128;
   pragma Provide_Shift_Operators (Unsigned_128);

   package Endians_Unsigned_128 is new Byteflipper_Generics (Unsigned_128);

   type Signed_128 is range -(2**127) .. (2**127) - 1 with
     Size => 128;
   pragma Provide_Shift_Operators (Signed_128);

   package Endians_Signed_128 is new Byteflipper_Generics (Signed_128);

   type Float_128 is digits 18 with Size => 128;

   package Endians_Float_128 is new Byteflipper_Generics (Float_128);
end Byteflippers;
