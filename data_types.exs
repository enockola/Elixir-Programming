IO.puts "Hello World"
# IO.puts prints the string above in the terminal.
IO.puts ("Hell0"); IO.puts("World");
# Elixir does not need line endings to function since it is loosely typed

some_random_value = 42
# Elixir usese snake cases

cannot_be_used_as_variables = ["after", "and", "catch", "do", "inbits", "inlist", "nil", "else", "end", "not", "or", "false", "fn", "in", "rescue", "true", "when", "xor", "__MODULE__", "__FILE__", "__DIR__", "__ENV__", "__CALLER__"]
# These words are reserved

# Numerical data types:
number = 42

octal = 0o52 # is equivalent to 42 in decimal

hexadecimal = 0xf1 # is equivalent to 241 in decimal

binary = 0b1101

#  Atoms
:hello

# Booleans
true
false

# Strings
string = "abc123"

# Lists
list = [1, "Hello World", :an_atom, true]

# Tuples
tuple = { 1, "Hello", :an_atom, true}


### Why have both lists and tuples ###
#Lists are actually stored as linked lists, so insertions, deletions are very fast in lists.
#Tuples on the other hand, are stored in contiguous memory block, which make accessing them faster but adds an additional cost on insertions and deletions.

# to print variables, use IO.puts(variables)
IO.puts(list)
