## offsets.rb

require 'pry'
require 'date'
require './lib/date_offsets'
require './lib/key_offsets'

class Offsets

  attr_reader :key_chars,
              :date

  def initialize(key_chars, date)
    @key_chars = key_chars
    @date = date
  end

  # Input: array of key characters and date object
  # Output: array of positive or negative offsets to rotate character map by for encrypt & decrypt

  def total_offsets
    keys = KeyOffsets.new(@key_chars)
    key_array = keys.key_offset_array
    
    dates = DateOffsets.new(@date)
    date_array = dates.date_offset_array

    zipped_key = date_array.zip(key_array)
    zipped_key.map do |x|
      x.sum
    end

  end

  def negative_total_offsets
    total_offsets.map do |offset|
      -offset
    end
  end

end
