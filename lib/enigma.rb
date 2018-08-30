## enigma.rb

require 'pry'
require 'date'
require './lib/key_maker'
require './lib/offsets'
require './lib/date_offsets'

class Enigma
    attr_reader :character_map,
                :date,
                :key_chars,
                :key

  def initialize
    new_key = KeyMaker.new
    @generated_key = new_key.generate_key_number
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

  def encrypt(message, key = @generated_key, date = Date.today)
    @key = key
    @key_chars = key.chars
    @date = date
    offsets = Offsets.new(@key_chars, @date)
    @rotate_values = offsets.total_offsets
    subarrays = msg_subarrays(message)
    translated_array = translate_array(subarrays)

    translated_array.flatten.join
  end

  def decrypt(coded_msg, key, date = Date.today)
    @key_chars = key.chars
    @date = date

    offsets = Offsets.new(@key_chars, @date)
    @rotate_values = offsets.negative_total_offsets
    subarrays = msg_subarrays(coded_msg)
    translated_array = translate_array(subarrays)

    translated_array.flatten.join
  end

  def derive_comparisons(msg)
    array_of_arrays = msg_subarrays(msg)

    last = array_of_arrays[-1]
    second_to_last = array_of_arrays[-2]
    last_length = last.count
    pair = []

    if last_length == 4
      coded = last
      uncoded = ["n", "d", ".", "."]
      pair << coded << uncoded
    elsif last_length == 3
      coded = second_to_last
      uncoded = [".", ".", "e", "n"]
      pair << coded << uncoded
    elsif  last_length == 2
      coded = second_to_last
      uncoded = [".", "e", "n", "d"]
      pair << coded << uncoded
    elsif last_length == 1
      coded = second_to_last
      uncoded = ["e", "n", "d", "."]
      pair << coded << uncoded
    end

  end

  def crack(msg, date)
    comparisons = derive_comparisons(msg)
    crack_key(comparisons, date)
    decrypt(msg, @cracked_key, date)
  end

  def crack_key(array, date)
    cracked_key = []
    key_set = crack_key_rotations(array, date)
    # binding.pry
    cracked_key << key_set.shift.abs.to_s
    key_set.each do |x|
      # binding.pry
      cracked_key << x.abs.digits.last.to_s
    end
    @cracked_key = cracked_key.join
    # binding.pry
  end

  def crack_key_rotations(array, date)
    total_rotations = crack_rotations(array)
    d = DateOffsets.new(date)
    date_rotations = d.date_offset_array
    negatize_indexes(date_rotations)
    # binding.pry
    cracked_key_rotations = total_rotations.zip(date_rotations)
    cracked_key_rotations.map do |x|
      x.sum
    end
  end

  def crack_rotations(big_indexes_array)
    big_indexes_array.map! do |subarray|
      get_indexes(subarray)
    end
    # binding.pry
    compare_array = [big_indexes_array[0],
    negatize_indexes(big_indexes_array[1])]
    # binding.pry
    zipped_array = compare_array[0].zip(compare_array[1])
    zipped_array.map do |x|
      y = x.sum
      if y < 0
        y += @character_map.count
      end
      y
    end
    binding.pry
  end

  def negatize_indexes(array)
    array.map do |index|
      index = -index
    end
  end

  def get_indexes(array)
    array.map do |char|
      index = @character_map.find_index(char)
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

end
