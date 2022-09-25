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

package com.addi.toolbox.general;

import java.util.*;

import com.addi.core.functions.ExternalFunction;
import com.addi.core.interpreter.*;
import com.addi.core.tokens.OperandToken;
import com.addi.core.tokens.Token;

/**An external function for getting the stored variables*/
public class who extends ExternalFunction
{
	public OperandToken evaluate(Token[] operands, GlobalValues globals)
	{

		//if (operands != null)
   		//    throwMathLibException("who requires no arguments");

		Variable var;

		globals.getInterpreter().displayText("\nYour variables are:\n");

		Iterator iter = globals.getLocalVariables().getIterator();
		while(iter.hasNext())
		{
		    Map.Entry next = ((Map.Entry)iter.next());
		    var = ((Variable)next.getValue());
		    globals.getInterpreter().displayText(var.getName());
		}

		return null;		
	}
}

/*
@GROUP
general
@SYNTAX
who
@DOC
Returns a list of all the variables in the system.
@EXAMPLES
<programlisting>
who 
ans 
x 
y
</programlisting>
@NOTES
@SEE
whos
*/

