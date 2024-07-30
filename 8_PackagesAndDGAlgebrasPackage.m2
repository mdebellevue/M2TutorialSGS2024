-- Most useful code in M2 is provided by packages written by individual teams of mathematicians
-- A list of all available:
viewHelp "packages provided with Macaulay2"
-- To load a package
needsPackage "DGAlgebras"
-- Package code (along with all the rest of Macaulay2 code) is already on your computer
-- on my computer (linux) code is found in /usr/share/Macaulay2
-- To find locations on your computer:
path -- returns a list of place M2 looks for packages
Layout -- Returns list of all paths that Macaulay2 uses
-- To each of these paths, you must pre-append the prefix path to find them on your computer
prefixDirectory

-- Loading a package also loads its documentation
-- The top level of this documentation is at the package's name
viewHelp "DGAlgebras"
-- We can view documentation for any of the package's functions
viewHelp "koszulComplexDGA"

-- If you have defined a local meaning to symbol also defined by a package,
-- Your local assignment is "moved elsewhere" (see warning message produced by below)

systemOfParameters = 1
needsPackage "Depth"

-- You may see people use "loadPackage".
-- This is similar to "needsPackage" except needsPackage doesn't reload a package already loaded

-- We will now overview the DGAlgebras package
R = ZZ/101[x,y]/ideal(x^2,y^2)
-- DGA's can be manually constructed, but this is laborious
-- The most basic DGA is more readily available
K = koszulComplexDGA(R) -- Can also be done on an ideal
-- Once we have a dg algebra, we can adjoin more variables to kill cycles (up to specified EndDegree)
A = acyclicClosure(K, EndDegree=> 3)
-- We often will need to refer to the underlying graded algebra of a DGAlgebra
-- Conventionally denoted by the "natural" symbol from music
A.natural


-- The output does not make it clear which variables are of which degrees
-- We can extract this information:



-- Hw:
-- 1. Locate the "DGAlgebras" package code installed on your computer. Open it with emacs.
--    - How does the author create a new "DGAlgebra" type?
--    - How does the author create ways of making instances of DGAlgebras?
--    - Find an instance where the author installs a new method for DGAlgebras under an existing method function
-- 2. Locate the code for a package relating to your interests.
-- How does it approach performing some of the key computations relevant to your research interest?
