require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offsets'

class OffsetsTest < Minitest::Test

  def test_it_exists
    offs = Offsets.new(["1","2","3","4","5"], Date.new(1987, 7, 31))
    assert_instance_of(Offsets, offs)
  end

  def test_case_name
    
  end

  def test_it_can_total_offsets
    offs = Offsets.new(["1","2","3","4","5"], Date.new(1987, 7, 31))
    assert_instance_of(Array, offs.total_offsets)
    assert_equal(4, offs.total_offsets.count)
    assert_equal([21, 26, 40, 54], offs.total_offsets)
  end

  def test_negative_total_offsets
    offs = Offsets.new(["1","2","3","4","5"], Date.new(1987, 7, 31))
    actual = offs.negative_total_offsets
    assert_equal([-21, -26, -40, -54], actual)
  end

end
