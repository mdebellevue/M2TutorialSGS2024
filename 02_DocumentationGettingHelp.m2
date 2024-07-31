-- Documentation provides a robust resource for using Macaulay2.
-- In addition to documenting individual functions, data types etc.,
-- there are doc pages with general advice - similiar to this tutorial
-- You can browse the documentation on the website by using a site-specific search with your preferred search engine
-- For google, pre-append "site:macaulay2.com/doc" to your search

-- Macaulay2 comes with all its documentation, so you can browse it offline, still in a convenient HTML format viewable in your browser
-- viewHelp opens a browser page on a topic if it is available
viewHelp
viewHelp apply

-- Sometimes quotation marks are needed to ensure that the argument of viewHelp is interpreted as a string

viewHelp * -- Yields an error
viewHelp "*"
viewHelp "lists and sequences" -- needed here because of the spaces in the page name

-- To search the documentation, use "about"

about matrix

-- Help pages can also be viewed within Macaulay2 by running "help"

help Apply

-- Hw: 

-- 1. Pick a mathematical topic that interests you, and see if Macaulay2 has code relating to it
-- We haven't talked about packages yet, but it's likely that the topic you choose will be contained in one
-- you can view a list of all of them with
viewHelp "packages provided with Macaulay2"
-- Browse some of the documentation pages

-- 2. Try using "about" to search for a few topics, like "ideals"


