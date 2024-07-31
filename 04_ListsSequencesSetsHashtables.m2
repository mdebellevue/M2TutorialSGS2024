-- The four most important data objects in Macaulay2 are lists, sequences, sets, and hashtables.
-- There are many operations available.

L = {1,2,3}
-- A sequence
Seq = (1,2,3)
-- A set
S = toSet({1,2,3,2})



-- Sequences and lists are very similar.  There are some technical differences "under the hood".
-- Lists and sequences are very similar, with slightly different syntax and available functions
-- The documentation says that sequences are more optimized in some way (then why don't we only use them?)
-- I use them basically interchangeably (usually lists because it seems more routines are implemented for them) 
-- Many of the speed differences are only seen for enormous data sets
-- For an exhaustive description of these data types, see
viewHelp "lists and sequences"
viewHelp "Hashtable"
viewHelp "Set"

-- Here is my tl;dr summary
-*

                | Lists     | Sequences | Sets                    | Hashtables
----------------+-----------------------+-------------------------+---------------------------------------------------------
Initializing    | L = {1,2} | L = (1,2) | S = set({1,2,2})        | H = new HashTable from {key1 => value1, key2 => value2}
----------------+-----------------------+-------------------------+---------------------------------------------------------
Description     | ordered tuples        | unordered set           | function between finite sets (unordered sets)
----------------+-----------------------+-------------------------+---------------------------------------------------------
Access elements | L#n (n: a number)     |                         | H#key1 (numerical keys), H.key2 (if key2 is a global symbol)
		| (Index starts at 0)   |                         |
----------------+-----------------------+-------------------------+---------------------------------------------------------
Check           | isMember(a,L)         | isMember(a,S) (t/f)     | H#?key1
membership      | (returns true/false)  | S#?a                    | 
----------------+-----------------------+-------------------------+---------------------------------------------------------
Get cardinality | #L                    | #S                      | #H (number of key-value pairs - i.e., cardinality of domain) 
-------------------------------------------------------------------------------------------------------------------------------
Ideal for       | Storing ordered data  | set operations          | Storing unordered data
		| by its index          | (intersect, union, etc. |
	        +-----------------------+-------------------------+----------------------------------------------------------
		| applying functions    | removing duplicates     | very rapid lookup by key
		| itertively,           |                         |
		+-----------------------+-------------------------+---------------------------------------------------------
		|	    	        | Access by value         | 
----------------+-----------------------+-------------------------+---------------------------------------------------------
Bad at          | Lookup (finding data  | Access by index         | Access by value
		| matching a pattern)   |                         |
----------------+-----------------------+-------------------------+---------------------------------------------------------
                |                       |                         | Appending key-value pairs (key collisions must be handled)
----------------+-----------------------+-------------------------+---------------------------------------------------------
Caution!        |                       | Order not preserved ("toSet" and "new HashTable from" are not invertible)

*-

-- A summary of common list operations
-- (L is a list, f is a function)
-- Convert to sequence, and convert sequence to list
S = toSequence L
K = toList S
-- Apply a function to each element in a list
-- (faster than a for loop, more visually compact too)
apply(L,f)
-- Access the last entry of a list
last L
L#(-1) -- further negative indexing is supported
-- Create common sequences
1..3  -- yields (1,2,3)
(3:1) -- yields (3,3,3)

-- Flatten a list one level
-- CAUTION: Flattening a matrix flattens by column, rather than by row
flatten {{1,2},{{3,4}}} -- yields {1,2,{3,4}}
flatten matrix {{1,2},{3,4}} -- yields {1,3,2,4}
-- flatten sequences contained in a list
-- Again, only one level (deepSplice flattens all the way down)
splice {(1,2),(3:3)} -- yields {1,2,3,3,3}

-- Produce a new list with "a" appended to the END
-- Old list is UNCHANGED (see immutable vs. mutable objects later in this tutorial)
append(L,a)
insert(n,L,a) -- insert in index n
-- Remove a value "a"
delete(a,L)
-- Remove the value at index "n"
drop(L,{n,n})
-- Searching:
-- Get list of all entries satisfying a condition
-- Here "f" is a function returning "true" or "false"
-- get all even numbers
select(L, even)
-- Get indices of all entries satisfying a condition
-- get the indices of all even numbers
positions(L,even)

-- Concatenate lists
L = join({1,2},{3,4})
-- The vertical bar | is also used for this
L = {1,2} | {3,4}

-- Group the list by a function (get the fibers under a function)
-- Here the function is n -> even n, mapping an integer to whether or not it is even
partition(n -> even n, {1,2,3,4})

-- Count instances of duplicates in a list
tally({1,2,2,3,3,3,4,4,4,4})

-- Common hashtable operations (H is a list, key is a key, val is a value)
-- extract list of keys or values or pairs
keys H
values H
pairs H


-- Hw:
-- 1. use select, toList, and sequence builder notation to create a list of all even numbers from 1 to 100

-- 2. If you know how to use for loops, create a hash table mapping the odd numbers from 1 to 99 to their successor even number
-- Otherwise, create a hash table sending 1 to 2, 3 to 4, and 5 to 6.

-- 3. Create the six lists comprising all orderings of 1,2,3.  Run "set" on each of them, and then run "toList" on each of those sets.
-- How does the order appear to be changing?
