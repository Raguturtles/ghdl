--  GHDL Run Time (GRT) stdio subprograms for GRT types.
--  Copyright (C) 2002, 2003, 2004, 2005 Tristan Gingold
--
--  GHDL is free software; you can redistribute it and/or modify it under
--  the terms of the GNU General Public License as published by the Free
--  Software Foundation; either version 2, or (at your option) any later
--  version.
--
--  GHDL is distributed in the hope that it will be useful, but WITHOUT ANY
--  WARRANTY; without even the implied warranty of MERCHANTABILITY or
--  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
--  for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with GCC; see the file COPYING.  If not, write to the Free
--  Software Foundation, 59 Temple Place - Suite 330, Boston, MA
--  02111-1307, USA.
with System;
with Grt.Types; use Grt.Types;
with Grt.Stdio; use Grt.Stdio;

package Grt.Astdio is
   pragma Preelaborate (Grt.Astdio);

   --  Procedures to disp on STREAM.
   procedure Put (Stream : FILEs; Str : String);
   procedure Put_I32 (Stream : FILEs; I32 : Ghdl_I32);
   procedure Put_U32 (Stream : FILEs; U32 : Ghdl_U32);
   procedure Put_I64 (Stream : FILEs; I64 : Ghdl_I64);
   procedure Put_U64 (Stream : FILEs; U64 : Ghdl_U64);
   procedure Put_F64 (Stream : FILEs; F64 : Ghdl_F64);
   procedure Put (Stream : FILEs; Addr : System.Address);
   procedure Put (Stream : FILEs; Str : Ghdl_C_String);
   procedure Put (Stream : FILEs; C : Character);
   procedure New_Line (Stream : FILEs);

   --  Display time with unit, without space.
   --  Eg: 10ns, 100ms, 97ps...
   procedure Put_Time (Stream : FILEs; Time : Std_Time);

   --  And on stdout.
   procedure Put (Str : String);
   procedure Put (C : Character);
   procedure New_Line;
   procedure Put_Line (Str : String);
   procedure Put (Str : Ghdl_C_String);

   --  Put STR using put procedures.
   procedure Put_Str_Len (Stream : FILEs; Str : Ghdl_Str_Len_Type);

   --  Put " to " or " downto ".
   procedure Put_Dir (Stream : FILEs; Dir : Ghdl_Dir_Type);
end Grt.Astdio;
