## enigma.rb

require 'date'

class Enigma
    attr_reader :character_map

  def initialize
    @character_map = [*('a'..'z'), *('0'..'9'), ' ', '.', ',']
  end

  def generate_key_number
   rand(10 ** 5).to_s.rjust(5, "0")
  end

  # take in 5-digit number and transform into 4 2-digit keys (A-D)
  def create_key_array
    generate_key_number.chars
  end

#   def create
# take array and assign each A..D variable to 2 digit-integer
#
#   def reformat_date
#     #take date in format 20YY-MM-DD to DDMMYY
#   end
#
#   def calculate_total_offsets
#     #for each, A-D, add relevant key to offset
#   end
#
end
