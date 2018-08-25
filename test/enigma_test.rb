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

# it might be worth noting that, VERY rarely, the final assertion of this test will fail.
def test_it_can_generate_random_key_number
  e = Enigma.new
  assert(e.generate_key_number)
  assert_instance_of(String, e.generate_key_number)
  assert_equal(5, e.generate_key_number.length)
  expected = e.generate_key_number
  refute_equal(expected, e.generate_key_number)
  assert_instance_of(Integer, e.generate_key_number.to_i)
end

def test_it_can_convert_key_number_to_array
  e = Enigma.new
  assert_instance_of(Array, e.create_key_array)
  assert_equal(5, e.create_key_array.count)
  assert_equal(['1', '2', '3', '4', '5'], e.create_key_array("12345"))
end

def test_it_can_generate_key_a
  e = Enigma.new
  test_key_array = e.create_key_array("12345")
  assert_equal(12, e.create_key_a(test_key_array))
  assert_instance_of(Integer, e.create_key_a)
  assert_equal(2, e.create_key_a.digits.count)
end

def test_it_can_generate_key_b
  e = Enigma.new
  test_key_array = e.create_key_array("12345")
  assert_equal(23, e.create_key_b(test_key_array))
  assert_instance_of(Integer, e.create_key_b)
  assert_equal(2, e.create_key_b.digits.count)
end

def test_it_can_generate_key_c
  e = Enigma.new
  test_key_array = e.create_key_array("12345")
  assert_equal(34, e.create_key_c(test_key_array))
  assert_instance_of(Integer, e.create_key_c)
  assert_equal(2, e.create_key_c.digits.count)
end

def test_it_can_generate_key_d
  e = Enigma.new
  test_key_array = e.create_key_array("12345")
  assert_equal(45, e.create_key_d(test_key_array))
  assert_instance_of(Integer, e.create_key_d)
  assert_equal(2, e.create_key_d.digits.count)
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
