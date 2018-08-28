## date_offsets.rb

require 'pry'
require 'date'

class DateOffsets
  attr_reader :date

  def initialize(date)
    @date = date
  end

  # Input: date object
  # Output: array of 4 date-based offset integers

  def convert_date
    (@date.strftime('%d') + @date.strftime('%m') + @date.strftime('%y')).to_i
  end

  def square_date
    (convert_date ** 2)
  end

  def date_offset_array
    square_date.digits.reverse[-4..-1]
  end

end
