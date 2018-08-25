## enigma.rb

require 'pry'

require 'date'

class Enigma
    attr_reader :character_map

  def initialize
    @character_map = [*('a'..'z'), *('0'..'9'), ' ', '.', ',']
  end

  def generate_key_number
   rand(10 ** 5).to_s.rjust(5, "0")
  end

  # take in 5-digit number and transform into 4 2-digit keys (A-D)
  def create_key_array(key_nums = generate_key_number)
    key_nums.chars
  end

  def create_key_a(input_key = create_key_array)
    input_key[0..1].join.to_i
  end

  def create_key_b(input_key = create_key_array)
    input_key[1..2].join.to_i
  end

  def create_key_c(input_key = create_key_array)
    input_key[2..3].join.to_i
  end

  def create_key_d(input_key = create_key_array)
    input_key[3..4].join.to_i
  end

  def reformat_day
    Date.today.day.to_s.rjust(2, "0")
  end

  def reformat_month
    Date.today.month.to_s.rjust(2, "0")
  end

  def reformat_year
    Date.today.year.to_s[2..3]
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

  def total_offsets
    key_array = [create_key_a, create_key_b, create_key_c, create_key_d]
    zipped_key = last_4.zip(key_array)
    zipped_key.map do |x|
      x.sum
    end
  end

##during encryption, A..B will be called using indexes 0..4 from zipped_key array.

#   def reformat_date
#     #take date in format 20YY-MM-DD to DDMMYY
#   end
#


end
