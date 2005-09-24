/*  GRT C bindings.
    Copyright (C) 2002, 2003, 2004, 2005 Tristan Gingold.

    GHDL is free software; you can redistribute it and/or modify it under
    the terms of the GNU General Public License as published by the Free
    Software Foundation; either version 2, or (at your option) any later
    version.

    GHDL is distributed in the hope that it will be useful, but WITHOUT ANY
    WARRANTY; without even the implied warranty of MERCHANTABILITY or
    FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
    for more details.

    You should have received a copy of the GNU General Public License
    along with GCC; see the file COPYING.  If not, write to the Free
    Software Foundation, 59 Temple Place - Suite 330, Boston, MA
    02111-1307, USA.
*/
#include <stdio.h>
#include <stdlib.h>
#include <setjmp.h>

FILE *
__ghdl_get_stdout (void)
{
  return stdout;
}

FILE *
__ghdl_get_stdin (void)
{
  return stdin;
}

FILE *
__ghdl_get_stderr (void)
{
  return stderr;
}

static int run_env_en;
static jmp_buf run_env;

void
__ghdl_maybe_return_via_longjump (int val)
{
  if (run_env_en)
    longjmp (run_env, val);
}

int
__ghdl_run_through_longjump (int (*func)(void))
{
  int res;

  run_env_en = 1;
  res = setjmp (run_env);
  if (res == 0)
    res = (*func)();
  run_env_en = 0;
  return res;
}

#if 1
void
__gnat_last_chance_handler (void)
{
  abort ();
}

void *
__gnat_malloc (size_t size)
{
  void *res;
  res = malloc (size);
  return res;
}

void
__gnat_free (void *ptr)
{
  free (ptr);
}

void *
__gnat_realloc (void *ptr, size_t size)
{
  return realloc (ptr, size);
}
#endif
