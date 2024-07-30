-- Macaulay2 has "for" and "while" loops, and if/then/elseif/else conditional statements.
-- For loops start at 0 by default
for i to 3 do print(i)
-- Adding "from" changes this
for i from 1 to 3 do print(i)
-- We can iterate over sets
L = {2,4,6}
for i in L do print(i)

-- While loops have similar syntax
i = 0
while i < 3 do (print(i); i = i+1)

-- Loops either "do" or "list"
-- if "do" then they execute the code following "do" and discard the result
-- if "list" then the result of the executed code is stored in a list, indexed sequentially

L = for i to 3 list i

-- For more details
viewHelp "for"
viewHelp "while"

-- Conditionals: if/then/else if/else 

if even 4 then print("Awesome") else print("Math is a lie")

-- else may be ommitted

-- Conditionals can be chained together
L = {0,1,2}
-- Before executing this, decide if 2 gets printed or not
if isMember(1,L) then print(1) else if isMember(2,L) then print(2) else print("Nothing")

-- Loops are controlled with continue (skip a loop iteration) and break (exit the loop)
-- Note that == is used for equality checking, since = is for assignment
-- != checks non-equality, <= and >= check inequality, < and > strict inequality 

-- Before running these, try to predict which integers will be printed
for i to 3 do if i == 2 then continue else print(i)
for i to 3 do if i == 2 then break print(i)
for i to 3 do if i == 2 then break else print(i)

-- Hw

-- 1. Create a loop which prints the even integers from 1 to 100
-- 2. Create a loop which returns only the list of even integers from 1 to 100

