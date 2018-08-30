# crack.rb

require './lib/enigma'
require 'date'
require 'pry'

e = Enigma.new

p "Testing ..end.."
p e.encrypt("Testing ..end..", "12345")
p e.crack(e.encrypt("Testing ..end..", "12345"), Date.today)


# it can start by using the same methods to break the entire encrypted message into sub-arrays of 4 digits each and return the index values of the final 7 characters.

# (this information will tell us whether these characters are using the a,b,c, or d shift values. we should only need one of each.)

# one critical question we need to ask the instructors is whether we are to assume we have access to the character_map when we are coding the crack function.

# If so, it should be a simple matter to reverse-engineer the shift values of each of these final 7 characters by counting backwards shifts (to the original index of that relevant character from ..end..) for the values at index 1..4. these are the total rotation values. from there we can square the current date, subtract the relevant values of that from the total rotation values, and the result will be the KEY!!! (or, it might be the keys each minus the total number of characters in character map, since it can rotate more than one full time.)

# the runner file can use existing methods to decrypt the message once the key is decoded (obviously).
