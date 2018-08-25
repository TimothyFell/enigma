## enigma_test.rb

require 'pry'

require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test

def test_it_exists
  e = Enigma.new
  assert_instance_of(Enigma, e)
end

def test_it_has_character_map
  e = Enigma.new
  expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
  actual = e.character_map
  assert_equal(expected, actual)
end

def test_it_can_generate_random_key_number
  e = Enigma.new
  assert(e.generate_key_number)
  expected = e.generate_key_number
  refute_equal(expected, e.generate_key_number)
end

# this test will test the CEO method
  # def test_it_encrypts
  #
  # end
  #
  # def test_it_takes_input
  #   e = Enigma.new
  #   my_message = "this is so secret ..end.."
  #   output = e.encrypt(my_message)
  #
  #   my_message
  # end
  #
  # def test_it_transforms_msg_to_subarrays
  #
  # end



end
