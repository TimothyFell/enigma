require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class KeyOffsetsTest < Minitest::Test

  def test_it_exists
    key_o = KeyOffsets.new(["1","2","3","4","5"])
    assert_instance_of(KeyOffsets, key_o)
  end

  def test_it_has_attributes
    key_o = KeyOffsets.new(["1","2","3","4","5"])
    assert_equal(["1","2","3","4","5"], key_o.key_chars)
  end

  def test_it_can_generate_key_a
    key_o = KeyOffsets.new(["1","2","3","4","5"])
    assert_equal(12, key_o.create_key_a)
    assert_instance_of(Integer, key_o.create_key_a)
  end

  def test_it_can_generate_key_b
    key_o = KeyOffsets.new(["1","2","3","4","5"])
    assert_equal(23, key_o.create_key_b)
    assert_instance_of(Integer, key_o.create_key_b)
  end

  def test_it_can_generate_key_c
    key_o = KeyOffsets.new(["1","2","3","4","5"])
    assert_equal(34, key_o.create_key_c)
    assert_instance_of(Integer, key_o.create_key_c)
  end

  def test_it_can_generate_key_d
    key_o = KeyOffsets.new(["1","2","3","4","5"])
    assert_equal(45, key_o.create_key_d)
    assert_instance_of(Integer, key_o.create_key_d)
  end

  def test_it_can_create_an_array_of_keys
    key_o = KeyOffsets.new(["1","2","3","4","5"])
    assert_equal([12,23,34,45], key_o.key_offset_array)
  end

end
