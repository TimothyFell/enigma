require 'simplecov'
SimpleCov.start
require './test_helper'
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
    expected = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ",", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "[", "]", "<", ">", ";", ":", "/", "?", "|", "'", "\\", "\n"]
    actual = e.character_map
    assert_equal(expected, actual)
  end

  def test_it_encrypts
    e = Enigma.new
    actual = e.encrypt("test", "12345", Date.new(1987, 7, 31))
    assert_equal("@4'M", actual)
  end

  def test_it_encrypts_with_one_arg
    e = Enigma.new
    actual = e.encrypt("test")
    assert_equal(4, actual.length)
    assert_instance_of(String, actual)
    assert_equal(e.date, Date.today)
    refute_equal(['1', '2', '3', '4', '5'], e.key_chars)
  end

  def test_it_encrypts_with_caps
    e = Enigma.new
    actual = e.encrypt("TEST", "12345", Date.new(1987, 7, 31))
    assert_equal("oe6(", actual)
    e_2 = Enigma.new
    actual = e_2.encrypt("TEST")
    assert_equal(4, actual.length)
    assert_instance_of(String, actual)
    assert_equal(e_2.date, Date.today)
    refute_equal(['1', '2', '3', '4', '5'], e_2.key_chars)
  end

  def test_it_decrypts
    e = Enigma.new
    actual = e.decrypt("@4'M", "12345", Date.new(1987, 7, 31))
    assert_equal("test", actual)
  end

  def test_it_decrypts_without_date
    e = Enigma.new
    actual = e.decrypt(e.encrypt("test", "12345"), "12345")
    assert_equal("test", actual)
  end

  def test_it_creates_msg_subarrays
    e = Enigma.new
    expected = [["t", "h", "i", "s"], [" ", "o", "n", "e"]]
    actual = e.msg_subarrays("this one")
    assert_equal(expected, actual)
  end

  def test_it_translates_array
    e = Enigma.new
    e.encrypt("test", "12345", Date.new(1987, 7, 31))
    expected = [["@", "7", ")", "L"], ["|", "@", ";", "'"]]
    actual = e.translate_array([["t", "h", "i", "s"], [" ", "o", "n", "e"]])
    assert_equal(expected, actual)
  end

  def test_it_translates_subarrays
    e = Enigma.new
    e.encrypt("test", "12345", Date.new(1987, 7, 31))
    expected = ["@", "7", ")", "L"]
    actual = e.translate_subarrays(["t", "h", "i", "s"])
    assert_equal(expected, actual)
  end

end
