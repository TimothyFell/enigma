require 'simplecov'
SimpleCov.start
require './test_helper'
require 'minitest/autorun'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/date_offsets'

class DateOffsetsTest < Minitest::Test

  def test_it_exists
    date_o = DateOffsets.new(Date.today)
    assert_instance_of(DateOffsets, date_o)
  end

  def test_it_has_attributes
    date_o = DateOffsets.new(Date.new(1987, 7, 31))
    assert_equal(Date.new(1987, 7, 31), date_o.date)
  end

  def test_it_can_convert_date_to_integer
    date_o = DateOffsets.new(Date.new(1987, 7, 31))
    assert_instance_of(Integer, date_o.convert_date)
    assert(date_o.convert_date.digits.count >= 5)
    assert(date_o.convert_date.digits.count <= 6)
    assert_equal(310787, date_o.convert_date)
  end

  def test_it_can_square_integer_date
    date_o = DateOffsets.new(Date.new(1987, 7, 31))
    assert_instance_of(Integer, date_o.square_date)
    expected = Math.sqrt(date_o.square_date)
    assert_equal(expected, date_o.convert_date)
    assert_equal(96588559369, date_o.square_date)
  end

  def test_it_can_get_last_4_of_squared_date
    date_o = DateOffsets.new(Date.new(1987, 7, 31))
    assert_instance_of(Array, date_o.date_offset_array)
    assert_equal(4, date_o.date_offset_array.count)
    assert_equal([9,3,6,9], date_o.date_offset_array)
  end

end
