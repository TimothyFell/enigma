## key_offsets.rb

require 'pry'
require 'date'

class KeyOffsets

  def initialize(key_chars)
    @key_chars = key_chars
  end

  # Input: array of key characters
  # Output: array of 4 key-based offset integers
  def create_key_a
    @key_chars[0..1].join.to_i
  end

  def create_key_b
    @key_chars[1..2].join.to_i
  end

  def create_key_c
    @key_chars[2..3].join.to_i
  end

  def create_key_d
    @key_chars[3..4].join.to_i
  end

  def key_offset_array
    [create_key_a, create_key_b, create_key_c, create_key_d]
  end

end
