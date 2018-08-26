## enigma.rb

require 'pry'

require 'date'

class Enigma
    attr_reader :character_map
    attr_writer :key_chars

  def initialize
    @character_map = [*('a'..'z'), *('0'..'9'), ' ', '.', ',']
    @key_chars = []
  end

  def encrypt(message, key = generate_key_number, date = Date.today)
    @key_chars = key.chars
    @date = date
    # take the key/date and return total offsets
    rotate_values = total_offsets(@key_chars, @date)
    # break message into array of characters, then into subarrays
    subarrays = msg_subarrays(message)
    # translate the message characters into index #s from @character_map
    # add total offsets to respective index #s
    # call rotated/new index numbers from @character_map
    translated_array = translate_array(subarrays)
    # flatten, then join these to return encrypted message
    translated_array.flatten.join
  end

  def total_offsets(key, date)
    key_array = [create_key_a, create_key_b, create_key_c, create_key_d]
    zipped_key = last_4(date).zip(key_array)
    zipped_key.map do |x|
      x.sum
    end
  end

  def generate_key_number
   rand(10 ** 5).to_s.rjust(5, "0")
  end

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

  def reformat_day(date = Date.today)
    date.day.to_s.rjust(2, "0")
  end

  def reformat_month(date = Date.today)
    date.month.to_s.rjust(2, "0")
  end

  def reformat_year(date = Date.today)
    date.year.to_s[2..3]
  end

  def convert_date
    (reformat_day + reformat_month + reformat_year).to_i
  end

  def square_date
    (convert_date ** 2)
  end

  def last_4(date = Date.new(1987, 7, 31))
    square_date.digits.reverse[-4..-1]
  end

  def msg_subarrays(message)
    message.chars.each_slice(4).to_a
  end

  def translate_array(sub_arrays)
    sub_arrays.map do |subarray|
      translate_subarrays(subarray)
    end
  end

  def translate_subarrays(subarray)
    subarray.map.with_index do |char, i|
      orig_index = @character_map.find_index(char)
      # rotated_index = orig_index + total_offsets(@key_chars, @date)[i]
      rotated_map = @character_map.rotate(total_offsets(@key_chars, @date)[i])
      rotated_map[orig_index]
    end
  end

end
