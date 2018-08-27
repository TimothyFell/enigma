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

  def test_it_can_generate_key_a
    e = Enigma.new
    e.encrypt("test", "12345", Date.new(1987, 7, 31))
    assert_equal(12, e.create_key_a)
    assert_instance_of(Integer, e.create_key_a)
  end

  def test_it_can_generate_key_b
    e = Enigma.new
    e.encrypt("test", "12345", Date.new(1987, 7, 31))
    assert_equal(23, e.create_key_b)
    assert_instance_of(Integer, e.create_key_b)
  end

  def test_it_can_generate_key_c
    e = Enigma.new
    e.encrypt("test", "12345", Date.new(1987, 7, 31))
    assert_equal(34, e.create_key_c)
    assert_instance_of(Integer, e.create_key_c)
  end

  def test_it_can_generate_key_d
    e = Enigma.new
    e.encrypt("test", "12345", Date.new(1987, 7, 31))
    assert_equal(45, e.create_key_d)
    assert_instance_of(Integer, e.create_key_d)
  end

  def test_it_can_reformat_day
    e = Enigma.new
    e.encrypt("test", "12345", Date.new(1987, 7, 31))
    assert_instance_of(String, e.reformat_day)
    assert_equal(2, e.reformat_day.length)
    assert_equal("31", e.reformat_day)
  end

  def test_it_can_reformat_month
    e = Enigma.new
    e.encrypt("test", "12345", Date.new(1987, 7, 31))
    assert_instance_of(String, e.reformat_month)
    assert_equal(2, e.reformat_month.length)
    assert_equal("07", e.reformat_month)
  end

  def test_it_can_reformat_year
    e = Enigma.new
    e.encrypt("test", "12345", Date.new(1987, 7, 31))
    assert_instance_of(String, e.reformat_year)
    assert_equal(2, e.reformat_year.length)
    assert_equal("87", e.reformat_year)
  end

  def test_it_can_convert_date_to_integer
    e = Enigma.new
    e.encrypt("test", "12345", Date.new(1987, 7, 31))
    assert_instance_of(Integer, e.convert_date)
    assert(e.convert_date.digits.count >= 5)
    assert(e.convert_date.digits.count <= 6)
  end

  def test_it_can_square_integer_date
    e = Enigma.new
    e.encrypt("test", "12345", Date.new(1987, 7, 31))
    assert_instance_of(Integer, e.square_date)
    expected = Math.sqrt(e.square_date)
    assert_equal(expected, e.convert_date)
  end

  def test_it_can_get_last_4_of_squared_date
    e = Enigma.new
    e.encrypt("test", "12345", Date.new(1987, 7, 31))
    assert_instance_of(Array, e.last_4)
    assert_equal(4, e.last_4.count)
  end

  def test_it_can_total_offsets
    e = Enigma.new
    e.encrypt("test", "12345", Date.new(1987, 7, 31))
    assert_instance_of(Array, e.total_offsets("12345", Date.new(1987, 7, 31)))
    assert_equal(4, e.total_offsets("12345", Date.new(1987, 7, 31)).count)
  end

  def test_it_encrypts
    e = Enigma.new
    actual = e.encrypt("test", "12345", Date.new(1987, 7, 31))
    assert_equal("b4t8", actual)
  end

  def test_it_encrypts_with_one_arg
    e = Enigma.new
    actual = e.encrypt("test")
    assert_equal(4, actual.length)
    assert_instance_of(String, actual)
    assert_equal(e.date, Date.today)
    refute_equal(['1', '2', '3', '4', '5'], e.key_chars)
  end

end
