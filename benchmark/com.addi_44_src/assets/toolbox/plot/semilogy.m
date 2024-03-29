## Copyright (C) 1993, 1994, 1995, 1996, 1997, 1999, 2000, 2002, 2004,
##               2005, 2006, 2007 John W. Eaton
##
## This file is part of Octave.
##
## Octave is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or (at
## your option) any later version.
##
## Octave is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} {} semilogy (@var{args})
## Produce a two-dimensional plot using a log scale for the @var{y}
## axis.  See the description of @code{plot} for a description of the
## arguments that @code{semilogy} will accept.
## @seealso{plot, semilogx, loglog}
## @end deftypefn

## Author: jwe

function retval = semilogy (varargin)

  [h, varargin] = __plt_get_axis_arg__ ("semilogy", varargin{:});

  oldh = gca ();
  unwind_protect
    axes (h);
    newplot ();

    set (h, "yscale", "log");

    tmp = __plt__ ("semilogy", h, varargin{:});

    if (nargout > 0)
      retval = tmp;
    endif

  unwind_protect_cleanup
    axes (oldh);
  end_unwind_protect

endfunction
