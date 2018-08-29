require 'simplecov'
SimpleCov.start
require './test_helper'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_maker'

class KeyMakerTest < Minitest::Test

  def test_it_exists
    new_key = KeyMaker.new
    assert_instance_of(KeyMaker, new_key)
  end

  # it might be worth noting that, VERY rarely, the final assertion of this test will fail.
  def test_it_can_generate_random_key_number
    new_key = KeyMaker.new
    assert(new_key.generate_key_number)
    assert_instance_of(String, new_key.generate_key_number)
    assert_equal(5, new_key.generate_key_number.length)
    expected = new_key.generate_key_number
    refute_equal(expected, new_key.generate_key_number)
    assert_instance_of(Integer, new_key.generate_key_number.to_i)
  end

end
