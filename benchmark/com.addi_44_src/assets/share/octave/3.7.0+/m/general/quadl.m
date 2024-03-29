## Copyright (C) 1998-2012 Walter Gautschi
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
## @deftypefn  {Function File} {@var{q} =} quadl (@var{f}, @var{a}, @var{b})
## @deftypefnx {Function File} {@var{q} =} quadl (@var{f}, @var{a}, @var{b}, @var{tol})
## @deftypefnx {Function File} {@var{q} =} quadl (@var{f}, @var{a}, @var{b}, @var{tol}, @var{trace})
## @deftypefnx {Function File} {@var{q} =} quadl (@var{f}, @var{a}, @var{b}, @var{tol}, @var{trace}, @var{p1}, @var{p2}, @dots{})
##
## Numerically evaluate the integral of @var{f} from @var{a} to @var{b}
## using an adaptive Lobatto rule.
## @var{f} is a function handle, inline function, or string
## containing the name of the function to evaluate.
## The function @var{f} must be vectorized and return a vector of output values
## if given a vector of input values.
##
## @var{a} and @var{b} are the lower and upper limits of integration.  Both
## limits must be finite.
##
## The optional argument @var{tol} defines the relative tolerance with which
## to perform the integration.  The default value is @code{eps}.
##
## The algorithm used by @code{quadl} involves recursively subdividing the
## integration interval.
## If @var{trace} is defined then for each subinterval display: (1) the left
## end of the subinterval, (2) the length of the subinterval, (3) the
## approximation of the integral over the subinterval.
##
## Additional arguments @var{p1}, etc., are passed directly to the function
## @var{f}.  To use default values for @var{tol} and @var{trace}, one may pass
## empty matrices ([]).
##
## Reference: W. Gander and W. Gautschi, @cite{Adaptive Quadrature -
## Revisited}, BIT Vol. 40, No. 1, March 2000, pp. 84--101.
## @url{http://www.inf.ethz.ch/personal/gander/}
## @seealso{quad, quadv, quadgk, quadcc, trapz, dblquad, triplequad}
## @end deftypefn

##   Author: Walter Gautschi
##   Date: 08/03/98
##   Reference: Gander, Computermathematik, Birkhaeuser, 1992.

## 2003-08-05 Shai Ayal
##   * permission from author to release as GPL
## 2004-02-10 Paul Kienzle
##   * renamed to quadl for compatibility
##   * replace global variable terminate2 with local function need_warning
##   * add paper ref to docs

function q = quadl (f, a, b, tol = [], trace = false, varargin)

  if (nargin < 3)
    print_usage ();
  endif

  if (isa (a, "single") || isa (b, "single"))
    myeps = eps ("single");
  else
    myeps = eps;
  endif
  if (isempty (tol))
    tol = myeps;
  endif
  if (isempty (trace))
    trace = false;
  endif
  if (tol < myeps)
    tol = myeps;
  endif

  ## Track whether recursion has occurred
  global __quadl_recurse_done__;
  __quadl_recurse_done__ = false;
  ## Track whether warning about machine precision has been issued
  global __quadl_need_warning__;
  __quadl_need_warning__ = true;

  m = (a+b)/2;
  h = (b-a)/2;
  alpha = sqrt (2/3);
  beta = 1/sqrt (5);

  x1 = .942882415695480;
  x2 = .641853342345781;
  x3 = .236383199662150;

  x = [a, m-x1*h, m-alpha*h, m-x2*h, m-beta*h, m-x3*h, m, m+x3*h, ...
       m+beta*h, m+x2*h, m+alpha*h, m+x1*h, b];

  y = feval (f, x, varargin{:});

  fa = y(1);
  fb = y(13);

  i2 = (h/6)*(y(1) + y(13) + 5*(y(5)+y(9)));

  i1 = (h/1470)*(   77*(y(1)+y(13))
                 + 432*(y(3)+y(11))
                 + 625*(y(5)+y(9))
                 + 672*y(7));

  is = h*( .0158271919734802*(y(1)+y(13))
          +.0942738402188500*(y(2)+y(12))
          + .155071987336585*(y(3)+y(11))
          + .188821573960182*(y(4)+y(10))
          + .199773405226859*(y(5)+y(9))
          + .224926465333340*(y(6)+y(8))
          + .242611071901408*y(7));

  s = sign (is);
  if (s == 0)
    s = 1;
  endif
  erri1 = abs (i1-is);
  erri2 = abs (i2-is);
  if (erri2 != 0)
    R = erri1/erri2;
  else
    R = 1;
  endif
  if (R > 0 && R < 1)
    tol = tol/R;
  endif
  is = s * abs(is) * tol/myeps;
  if (is == 0)
    is = b-a;
  endif

  q = adaptlobstp (f, a, b, fa, fb, is, trace, varargin{:});

endfunction

## ADAPTLOBSTP  Recursive function used by QUADL.
##
##   Q = ADAPTLOBSTP('F', A, B, FA, FB, IS, TRACE) tries to
##   approximate the integral of F(X) from A to B to
##   an appropriate relative error.  The argument 'F' is
##   a string containing the name of f.  The remaining
##   arguments are generated by ADAPTLOB or by recursion.
##
##   Walter Gautschi, 08/03/98

function q = adaptlobstp (f, a, b, fa, fb, is, trace, varargin)
  global __quadl_recurse_done__;
  global __quadl_need_warning__;

  h = (b-a)/2;
  m = (a+b)/2;
  alpha = sqrt (2/3);
  beta = 1 / sqrt(5);
  mll = m-alpha*h;
  ml  = m-beta*h;
  mr  = m+beta*h;
  mrr = m+alpha*h;
  x = [mll, ml, m, mr, mrr];
  y = feval (f, x, varargin{:});
  fmll = y(1);
  fml  = y(2);
  fm   = y(3);
  fmr  = y(4);
  fmrr = y(5);
  i2 = (h/6)*(fa + fb + 5*(fml+fmr));
  i1 = (h/1470)*(77*(fa+fb) + 432*(fmll+fmrr) + 625*(fml+fmr) + 672*fm);
  if ((is+(i1-i2) == is || mll <= a || b <= mrr) && __quadl_recurse_done__)
    if ((m <= a || b <= m) && __quadl_need_warning__)
      warning ("quadl: interval contains no more machine number");
      warning ("quadl: required tolerance may not be met");
      __quadl_need_warning__ = false;
    endif
    q = i1;
    if (trace)
      disp ([a, b-a, q]);
    endif
  else
    __quadl_recurse_done__ = true;
    q = (  adaptlobstp (f, a  , mll, fa  , fmll, is, trace, varargin{:})
         + adaptlobstp (f, mll, ml , fmll, fml , is, trace, varargin{:})
         + adaptlobstp (f, ml , m  , fml , fm  , is, trace, varargin{:})
         + adaptlobstp (f, m  , mr , fm  , fmr , is, trace, varargin{:})
         + adaptlobstp (f, mr , mrr, fmr , fmrr, is, trace, varargin{:})
         + adaptlobstp (f, mrr, b  , fmrr, fb  , is, trace, varargin{:}));
  endif
endfunction


## basic functionality
%!assert (quadl (@(x) sin (x), 0, pi, [], []), 2, -3e-16)

## the values here are very high so it may be unavoidable that this fails
%!assert (quadl (@(x) sin (3*x).*cosh (x).*sinh (x),10,15),
%!         2.588424538641647e+10, -1.1e-14)

## extra parameters
%!assert (quadl (@(x,a,b) sin (a + b*x), 0, 1, [], [], 2, 3),
%!        cos(2)/3 - cos(5)/3, -3e-16)

## test different tolerances.
%!assert (quadl (@(x) sin (2 + 3*x).^2, 0, 10, 0.3, []),
%!        (60 + sin(4) - sin(64))/12, -0.3)
%!assert (quadl (@(x) sin (2 + 3*x).^2, 0, 10, 0.1, []),
%!        (60 + sin(4) - sin(64))/12, -0.1)

