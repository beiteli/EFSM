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

package com.addi.toolbox.io;


import java.io.*;

import com.addi.core.functions.ExternalFunction;
import com.addi.core.interpreter.GlobalValues;
import com.addi.core.tokens.*;

public class createnewfile extends ExternalFunction
{
	public OperandToken evaluate(Token[] operands, GlobalValues globals)
	{

        if (getNArgIn(operands) != 1)
			throwMathLibException("createnewfile: number of arguments != 1");

		if (!(operands[0] instanceof CharToken)) 
            throwMathLibException("createnewfile: argument must be a string");

        String name = ((CharToken)operands[0]).getElementString(0);

        File file=null;

        try
		{
			if (name.startsWith("/")) {
				file = new File(name);
			} else {
				file = new File(globals.getWorkingDirectory(),name);
			}

            if(!file.createNewFile())
                throwMathLibException("create new file: did not work");
		}
		catch (Exception e)
		{
            throwMathLibException("create new file: exception");
		}		    

		return null;		

	} // end eval
}

/*
@GROUP
IO
@SYNTAX
createnewfile(filename)
@DOC
use this script to create a new file.
@EXAMPLES
<programlisting>
createnewfile("bar.txt");
</programlisting>
@SEE
cd, dir, exist, mkdir, rmdir, delete, isfile, isdirectory, ishidden, lastmodified
*/

