-- Function notation is similar to "maps to" notation used on e.g. whiteboards
-- The successor function:
x -> x+1
-- We can assign a symbol to a function
f = x -> x+1
-- More complicated functions can involve a sequence of expressions
f = x -> (
    if even x then x+1;
    else x
    )
-- Multiple arguments are handled using a sequence
f = (x,y) -> x+y

-- The code of an existing function can be viewed
code f

-- Functions can be composed, and can return functions as their values
-- see the following for more details
viewHelp "making functions"

-- No type checking is available for functions.
-- For instance, the following yields an error
f = x -> x+1
f(ZZ/3[x])
-- There also is no way to provide parameters or optional arguments to a function
-- To do these things, we need methods
   
-- Everything in Macaulay2 has a class/type
class f
class (ZZ/101)

instance(f,Function)

-- Classes have inclusion relations among them
-- class returns the smallest class to which a thing belongs
instance(ZZ/101,Ring) -- returns true because a quotient ring is still a ring
-- You can see all types currently known
showStructure

-- Method functions provide a means of type checking
-- An empty method is easy to initialize
f = method()
-- methods for a particular class are installed one by one
-- The class and the colon := are added to the notation for defining a function, but otherwise the notation is the same
f ZZ := x -> x+1
-- Optional arguments can be included with default values throughout
-- An option table is a hash table
g = method(Options => {Slope => 2, Intercept => 4}
-- The construction is a function which takes an option table as input and returns the method function as output
-- "opts" is an arbitrary variable name
g ZZ := opts -> x -> opts.Slope*x+opts.Intercept
-- Options are changed by adding hash table keys to the list of arguments
g(3, Slope => 4, Intercept => 0)
-- Optional arguments can be added to a method with default values set for each installed method
-- (rather than being global across all methods)
h = method()
-- Default options are attached to a variable using >>
-- The notation is otherwise the same
h ZZ := {Slope => 2} >> opts -> x -> opts.Slope*x

-- The smallest class containing an object is what is used for selecting a method
h Ring := R -> res coker vars R
h QuotientRing := R -> (
    print("WARNING: This is actually probably infinite!!");
    res coker vars R
    )
h(ZZ/2[x,y]/ideal(x^2))

-- To install a method that takes multiple arguments
-- Give a sequence of types of each argument
h (ZZ,ZZ) := {Intercept => 1} >> opts -> (m,x) -> m*x+opts.Intercept
-- Methods can only take four arguments by default
-- To handle more, either make one of the arguments a list,
-- or change the dispatch (see the help page for methods for more details)

-- If you want an option name to be something already existing in M2
-- calling "symbol" is neccessary to ensure that M2 does not use that terms existing interpretation

p = method(Options => {symbol Ring => ZZ})
p ZZ := opts -> i -> opts.Ring^i

-- For an exhaustive guide on method functions, see
viewHelp "method"

-- Getting information about existing methods
options g
methods g -- Returns a hash table with values listing installed methods

-- Hw
-- 1. Create a function that takes an integer i and returns the polynomial ring in i variables over some field
-- 2. Create a method function with an optional argument "Field" that takes an integer i and returns the poly ring in i variables over that field
-- 3. Create a function which performs different operations for even or odd numbers
-- 4. Create a function which takes a method function and prints the code of each of its methods

