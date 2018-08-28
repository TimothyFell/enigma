## enigma.rb

require 'pry'

require 'date'

class Enigma
    attr_reader :character_map,
                :date,
                :key_chars,
                :key

  def initialize
    @key_chars = []
    @character_map = [
      *("A".."Z"),
      *("a".."z"),
      *("0".."9"),
      " ", ".", ",",
      "!", "@", "#",
      "$", "%", "^",
      "&", "*", "(",
      ")", "[", "]",
      "<", ">", ";",
      ":", "/", "?",
      "|", "'", "\\",
      "\n"
    ]
  end

  def encrypt(message, key = generate_key_number, date = Date.today)
    @key = key
    @key_chars = key.chars
    @date = date

    @rotate_values = total_offsets(@key_chars, @date)
    subarrays = msg_subarrays(message)
    translated_array = translate_array(subarrays)

    translated_array.flatten.join
  end

  def decrypt(coded_msg, key, date = Date.today)
    @key_chars = key.chars
    @date = date

    @rotate_values = negative_total_offsets
    subarrays = msg_subarrays(coded_msg)
    translated_array = translate_array(subarrays)

    translated_array.flatten.join
  end

  def negative_total_offsets
    total_offsets(@key_chars, @date).map do |offset|
      -offset
    end
  end

  def total_offsets(key, date)
    key_array = [create_key_a, create_key_b, create_key_c, create_key_d]
    zipped_key = last_4.zip(key_array)
    zipped_key.map do |x|
      x.sum
    end
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
      rotated_map = @character_map.rotate(@rotate_values[i])
      rotated_map[orig_index]
    end
  end

  # This is the random key generator
  def generate_key_number
   rand(10 ** 5).to_s.rjust(5, "0")
  end

  # These methods derive our respective key rotations
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
  
  # These methods calculate the additional date offsets
  def convert_date
    (@date.strftime('%d') + @date.strftime('%m') + @date.strftime('%y')).to_i
  end

  def square_date
    (convert_date ** 2)
  end

  def last_4
    square_date.digits.reverse[-4..-1]
  end

end
