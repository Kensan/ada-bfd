-----------------------------------------------------------------------
--  BFD -- Thin Ada layer for Bfd (common Bfd functions)
--  <!-- Copyright (C) 2002, 2003, 2004 Free Software Foundation, Inc.
--  Written by Stephane Carrez (stcarrez@nerim.fr)
--
--  This file is part of BfdAda.
--
--  This program is free software; you can redistribute it and/or
--  modify it under the terms of the GNU General Public License as
--  published by the Free Software Foundation; either version 2,
--  or (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; see the file COPYING.  If not, write to
--  the Free Software Foundation, 59 Temple Place - Suite 330,
--  Boston, MA 02111-1307, USA.  -->
-----------------------------------------------------------------------
--  This package defines the C import to access to the BFD C library.
--
with Bfd; use Bfd;
package Bfd.Thin is

   function Get_Error_Type return Integer;
   pragma Import (C, Get_Error_Type, "bfd_get_error");

   function Get_Error_Message (Code : Error) return Ptr;
   pragma Import (C, Get_Error_Message, "bfd_errmsg");

   function Get_Filename (File : in Ptr) return Ptr;
   pragma Import (C, Get_Filename, "_bfd_get_filename");

   function Get_Error return Error;
   pragma Import (C, Get_Error, "bfd_get_error");

   procedure Set_Error (Code : Error);
   pragma Import (C, Set_Error, "bfd_set_error");

   procedure Set_Error_Program_Name (P : in Ptr);
   pragma Import (C, Set_Error_Program_Name, "bfd_set_error_program_name");

   function Openr (Name : in String; Target : in Ptr) return Ptr;
   pragma Import (C, Openr, "bfd_openr");

   function Set_Error_Handler (To : in Error_Handler) return Error_Handler;
   pragma Import (C, Set_Error_Handler, "bfd_set_error_handler");

   procedure Close (File : in Ptr);
   pragma Import (C, Close, "bfd_close");

   function Check_Format (File : Ptr; What : Integer) return Boolean;
   pragma Import (C, Check_Format, "bfd_check_format");

   function Get_Start_Address (Bfd : Ptr) return Vma_Type;
   pragma Import (C, Get_Start_Address, "ada_bfd_get_start_address");

   function Get_Symbol_Count (Bfd : Ptr) return Natural;
   pragma Import (C, Get_Symbol_Count, "ada_bfd_get_symbol_count");


end Bfd.Thin;
