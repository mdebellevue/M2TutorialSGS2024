-- Various objects of interest in Macaulay2 can be initialized using syntax similar to how we ordinarily write them.
-- Available coefficient rings are ZZ (integers), ZZ/n for any n, QQ (rationals)
-- RR and CC (real and complex) are also available, although are less well developed 

-- Initialize a ring
R = ZZ/101[x,y]
S = ZZ/101[a_1..a_4]

-- Initialize an ideal
I = ideal(x^2)
J = ideal(a_1^2+a_2^2)

-- Initialize a quotient ring
Rbar = R/I

-- Both rings and ideals are simultaneously initialized.
-- Sometimes, it is ambiguous which ring an object belongs to.

T = ZZ/101[x,y,z]
K = ideal(y^2)

-- Notice that K is viewed to be an ideal of T, since T was the last ring which was initialized.
-- To switch which ring is given priority when disambiguating, there is the "use" command.

use R
L = ideal(y^2)

-- Multiple rings introduce complications.
-- In short:

-- Use "substitute" for reinterpreting variables in one ring as being variables in another
substitute(K,R)
-- It goes in both directions
substitute(substitute(K,R),T)

-- Use "promote" for mapping along a canonical ring map
Tquo = T/ideal(x^5)
promote(K,Tquo)
promote(matrix{{1,0},{0,1}},T)
-- Use "lift" for choosing a lift along a canonical ring map
-- (this is not always possible)

lift(2/1,ZZ)
lift(x^5,T)
-- For more information, see the following doc links

viewHelp "working with multiple rings"
viewHelp "substitute"
viewHelp "promote"
viewHelp "lift"

-- Modules --
-- Free modules are initialized with superscripts
M = R^1

-- To get a quotient ring as a module, the following convenience is implemented:
R^1/I

-- Non-free modules are initialized as kernels, images, cokernels, etc., of maps between free modules (so, matrices)
-- Matrices are initialized by calling "matrix" on a list of lists (each list being a row of the matrix)
-- Note that the asterisk * is always needed to indicate multiplication, as otherwise xy would be interpreted as a single (as of yet unassigned) symbol
N = coker matrix({{x^2,x*y},{y^2,x*y}})
-- Resolutions can be computed
-- Numerical invariants like graded Betti numbers can be computed
F = res N
betti F

-- WARNING: Over a singular ring, "res" returns a complex of length given by the number of variables plus one
-- This is because any complex of this length indicates that the resolution must be infinite
-- This behavior will be changed in future releases to require the length of the resolution to be specified if it is a module of infinity projective dimension

-- Hw:
-- 1. Compute the Betti numbers of your favorite module over your favorite ring.
-- If you don't have one:
-- R is a polynomial ring in three variables
-- and M is the quotient of a rank two free module spanned by e_1,e_2 by the submodule generated by x^2e_1,xyz e_1, xy e_2,  and z^3 e_2.
