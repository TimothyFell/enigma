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
    # take the key/date and return total offsets
    total_offsets(key, date)
    # break message into array of characters, then into subarrays
    # translate the message characters into index #s from @character_map
    # add total offsets to respective index #s
    # call rotated/new index numbers from @character_map
    # flatten, then join these to return encrypted message
  end

  # turn message into array > split("") > each_string(4).to_a

  def total_offsets(key, date)
    # create_key_array(key)
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

  def last_4
    square_date.digits.reverse[-4..-1]
  end



##during encryption, A..B will be called using indexes 0..4 from zipped_key array.

#   def reformat_date
#     #take date in format 20YY-MM-DD to DDMMYY
#   end
#


end
