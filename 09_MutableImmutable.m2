-- Most entities in Macaulay2 are immutable by default
-- This means that once assigned a memory location and filled with data,
-- That memory location/data can not be changed.
-- Any appearance of a change is really creating a new pointer to a memory location with modified data

-- Immutable objects are safer because there is no chance that two programs try to change it at the same time
-- This is at the expense of a lot of extra copying, which is slow

-- Macaulay2 provides mutable objects, which are much faster
-- Printing mutable lists might result in infinite loops (how exactly I don't know tbh)
-- Consequently, they are not displayed, requiring manual enumeration to see their elements

-- As seen in the examples at the end, this difference is only apparent for large data
-- (although, not that large)
-- The differences for large data sets are quite extreme

L = {0,1,2}
M = new MutableList from L
L#1 = 3 -- yields an error
M#1 = 3
for i in M do print i

-- We can append to mutable lists by assignment

M#3 = 3
for i in M do print i

-- There are mutable lists and mutable hash tables.
H = new MutableHashTable from {0 => 1}
H#0
-- We can similarly add keys by performing assignment
H#2 = 3
H#2

-- Preallocating the mutable list with empty data and assigning values later is fastest 
-- This is because memory allocation requires CPU time. Preallocating means its only done once
-- The following took .67 seconds on my desktop
time (
    M = new MutableList from (100000:0);
    for i to 99999 do M#i = i
    )
-- Creating an empty mutable list and appending is next-fastest.
-- Memory has to be allocated many times, but the list is growing in place
-- The following took 23.82 seconds on my desktop
time (
    M = new MutableList from {};
    for i to 99999 do M#i = i
    )
-- Appending to an immutable list is the slowest
-- The entire list must be re-copied
-- The following took 121.53 seconds on my desktop
time (
    L = {};
    for i to 99999 do L = append(L,i)
    )
    
-- I think the preallocation benefit only applies when there is some guarantee that 0 is the same memory size as the new input
-- The following two run about the same (37 seconds on my desktop)
-- Note that you should run the first block twice, as there is some internal overhead initializing the rings which is not done on a second pass-through
time (
    M = new MutableList from (1000:0);
    for i to 999 do M#i = ZZ/101[x_1..x_i]
    )
time (
    M = new MutableList from {};
    for i to 999 do M#i = ZZ/101[x_1..x_i];
    )

-- Hw:
-- 1. Create analogous examples to the above using hash tables.  How different are the speeds?

