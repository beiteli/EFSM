// Copyright (C) 2011 Free Software Foundation FSF
//
// This file is part of Addi.
//
// Addi is free software; you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 3 of the License, or (at
// your option) any later version.
//
// Addi is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Addi. If not, see <http://www.gnu.org/licenses/>.

package com.addi.toolbox.elfun;

import com.addi.core.functions.ExternalElementWiseFunction;

public class sin extends ExternalElementWiseFunction
{
    
    public sin()
    {
        name = "sin";
    }
    
    /**Calculates the sine of a complex number
     * @param arg = the angle as an array of double
     * @return the result as an array of double
     * */ 
    public double[] evaluateValue(double[] arg)
    {
        double result[] = new double[2];
        double scalar;
        double iz_re, iz_im;
        double _re1, _im1;
        double _re2, _im2;

        // iz:      i.Times(z) ...
        iz_re =  -arg[IMAG];
        iz_im =   arg[REAL];

        // _1:      iz.exp() ...
        scalar =  Math.exp(iz_re);
        _re1 =  scalar * Math.cos(iz_im);
        _im1 =  scalar * Math.sin(iz_im);

        // _2:      iz.neg().exp() ...
        scalar =  Math.exp(-iz_re);
        _re2 =  scalar * Math.cos(-iz_im);
        _im2 =  scalar * Math.sin(-iz_im);

        // _1:      _1.Minus(_2) ...
        _re1 = _re1 - _re2;                          // !!!
        _im1 = _im1 - _im2;                          // !!!

        // result:  _1.Div(2*i) ...
        result[REAL] = 0.5*_im1;
        result[IMAG] = -0.5*_re1;
        
        return result;
    }

}

/*
@@GROUP
trigonometric
@SYNTAX
answer = sin(angle)
@DOC
Returns the sine of angle.
@EXAMPLES
sin(0) = 0
sin(1.5708) = 1
@SEE
asin, sinh
*/

