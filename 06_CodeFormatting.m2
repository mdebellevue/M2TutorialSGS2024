-- So far, we have had short code that could fit on one line
-- More complicated programs will be too wide - breaking across lines eases understanding

-- A sequence of statements is enclosed by parenthesis
-- Each statement but for the last is terminated with a semicolon ;
-- The final statement is used for assignment
a = (j = 1+3; 2*j)
print(j)
-- j has been assigned a value also

-- Macaulay2 has "scopes"
-- The following establish a local scope:
--     - A sequence of statements
--     - Interior bodies of for and while loops
--     - Each loop of a for or while loop
--     - interior bodies of if/then/else
--     - function arguments
--     - bodies of functions
-- They nest, local scopes within local scopes
-- := is used for assignment respecting scope
-- Otherwise, assignment is global, and assignment has "side effects" outside of scope
for i to 3 do a = i
print(a) -- a has a value
-- The execution of the above code has the "side effect" of assigning a variable globally
for i to 3 do b := i
print(b) -- does not have a value.  No "side effect", assignment limited to scope

-- Lines are typically broken at new scopes, or after commas/semicolons in long lists
-- The following convention ensures that indentation level indicates scope
-- If broken at a new scope, indent one more level
-- If broken at a comma within an existing, keep the same level as that scope
--     often, one uses a break for each quantity, including the first

-- When starting a new sequence, list, function arguments etc,
-- Use an open parenthesis at the start of the break
-- The closing parenthesis is indented at the same level as the new scope
-- Parenthesis are uneccesary for single statements following a break
if even 3 then
    error("There is something wrong with the universe")

-- Emacs will try to impose these indentation conventions.
-- Sometimes (rarely) it gets them wrong.
-- Other text editors often will also try to impose indentation conventions,
-- but may not follow Macaulay2's conventions

for i to 3 do (
    print(i);
    print(" and then ")
    )

-- This has a trailing "and then " which we may want to remove
for i to 3 do (
    print(i);
    if i != 3 then (
	print(" and then ")
	)
    )
    
H = new HashTable from {
    1 => 2,
    3 => 4,
    5 => 6
    }
    
-- here we combine the parenthesese for enclosing the argument of matrix
-- and the curly brace for the list
A = matrix({
	{1,2,3},
	{4,5,6},
	{7,8,9}
	})

-- The above are rules of thumb which need not always be followed for code to execute correctly.
-- M2 is not indentation-sensitive, and allows extra empty lines:
for i to 3 do (
    print(i);
	    print(" and then ");

      )

-- Sometimes line breaks will change how code is interpreted
-- The following assigns to A the matrix function - presumably not intended

A = matrix 
    {{1,2,3},
    {2,3,4}
    }

-- Code commenting
-- I have already been using two hyphens -- to begin a comment
a = 3 -- This can be done at end of line
-*
starts a block comment,
which is ended by
*-
(b = 3; -* inline comments can be done with block comment *- c=3) 
-- Comments are good practice even when you're writing only for yourself

-- CamelCase capitalizes the first letter of each word, camelCase all but the first
-- CamelCase is used for types
Ideal
ChainComplex
-- camelCase is used for anything else requiring multi-word descriptions
-- Capitals can be used for single or multi-character names (not words)
AB = 3;

-- anything else: variable, function, ring, complex, etc.
mySpecialRing = ZZ/101[x,y]


-- Hw:

-- 1. Correct the indentation of the following blocks of code
for i to 3 do (print(i);
print(i); print(i)
    )

L = {1,2,3,4,5,6,
           7,8,9
	  }
