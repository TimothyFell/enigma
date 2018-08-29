## enigma.rb

require 'pry'
require 'date'
require './lib/key_maker'
require './lib/offsets'

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

  def crack(msg, date = Date.today)
    array_of_arrays = msg_subarrays(msg)
    length = array_of_arrays[-1].count
    second_to_last = array_of_arrays[-2]
    last = array_of_arrays[-1]
    relevant = []
    relevant << last
    relevant << second_to_last[(-4 + length)..-1]
    crack_key = ["n", "d", ".", "."].rotate(4 - length)
    
    else

  end



  def crack_array(relevants)
    relevants.map do |subarray|
      crack_subarrays(subarray)
    end
  end

  def crack_subarrays(subarray)
    subarray.map.with_index do |char, i|




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
