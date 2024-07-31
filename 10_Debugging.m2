-- M2 has a built in debugger with functions for helping understand errors and solve them
-- M2 has a tutorial for using the debugger that you should complete.   It's here:
viewHelp "the debugger"
-- When an error is produced, the file location, line number, and column number are printed
-- The format is path/to/file:StartLine:StartColumn-EndLine:EndColumn
-- (This is also the format returned by "code")

-- Most useful debugging tool:
viewHelp "listLocalSymbols"
-- Displays all assigned symbols within the current scope
-- Gives values current to the function, loop iteration, etc.
viewHelp "listUserSymbols"
-- All symbols that you have defined in your session - rings you've defined, etc

-- By default, the debugger is only entered for errors in your code and package code where "debug" is set to true by the package author
-- So, errors occuring in core routines won't start the debugger
-- To change this, decrease the error depth
errorDepth = 2
-- depth 3: user code and packages with debug set to true
-- depth 2: all loaded packages except core
-- depth 1: all loaded packages including core
-- depth 0: bootstrap code (low level interface to C)

-- Print to screen whenever function is called
-- (also prints inputs and outputs of that function)
g = on (f = x -> x^2)
h = t -> if even t then g(t)+1 else t+1
h(1)
h(2)

-- Leave the debugger
break

-- For a list of all debugging resources
viewHelp debugging

-- For error control in your own code:

-- Produce an error message and halt execution
h = t -> if odd t then error("Input must be even") else t/2

-- Prevent an error from stopping execution
f = t -> try 1/t then print("No errors happened!") else infinity
f(1)
f(0)
-- There is not currently a way to distinguish between errors and catch only certain ones
-- There is intention to add this functionality at some point (according to documentation)
-- As currently implemented, ALL errors are caught, which is dangerous
-- Use "try" only when you are confident that only one kind of error can occur

-- Speed testing
-- Basic:
time for 1 to 100 do x=i
-- The code above is only executed one time.
-- Other code running on your computer could affect this one execution
-- Furthermore, the first execution might cache some values that are also used by the function being compared to
-- To get accurate comparisons, one ought to execute code several times and average
-- This is automatically accomplished by "benchmark"
benchmark for 1 to 100 do x=i
-- However, you give up control over how many times the function is executed
-- This may be undesirable if the function takes a very long time to evaluate

-- Hw:

-- 1. Load the following functions into Macaulay2, and then execute the indicated input
-- Attempt to debug the code using the debugger
-- This code tries to only adjoing those variables in an acyclic closure whose differential is linear
linearSubDGA = (R,n) -> (
    K := koszulComplexDGA;
    L := getGenerators(K,DegreeLimit => 1, StartDegree=> 1)
    L := select(L, z -> |z| == 1);
    A := adjoinVariables(K,L);
    for i from 1 to n (
	L = getGenerators(A,DegreeLimit => n,StartDegre=>n);
	L = for z in L if not |z|==n then continue else list z;
	A = adjoinVariables(A,L);
	)
    )
-- This code computes the deviations of the artinian ring obtained from R by quotienting by a regular sequence
needsPackage "Depth"
artinianDeviations = method()
artinianDeviations Ideal := artiniainDeviations(ring I/I) 
artinianDeviations Ring := {DegreeLimit => 3} -> opts -> R -> (
    if not isHomogeneous then print("Only works for homogeneous right now")
    f := systemOfParameters R;
    Rbar = R/ideal(f);
    deviations(Rbar,DegreeLimit => DegreeLimit)
    )


    
    
