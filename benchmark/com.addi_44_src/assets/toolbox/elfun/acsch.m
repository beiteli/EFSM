## Copyright (C) 1994, 1996, 1997, 1999, 2000, 2005, 2006, 2007, 2008, 2009
##               John W. Eaton
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
## @deftypefn {Mapping Function} {} acsch (@var{x})
## Compute the inverse hyperbolic cosecant of each element of @var{x}.
## @seealso{csch}
## @end deftypefn

## Author: jwe

function w = acsch (z)

  if (nargin != 1)
    print_usage ();
  endif

  w = asinh (1 ./ z);

endfunction

%!test
%! v = [pi/2*i, -pi/2*i];
%! x = [-i, i];
%! assert(all (abs (acsch (x) - v) < sqrt (eps)));

%!error acsch ();

%!error acsch (1, 2);

