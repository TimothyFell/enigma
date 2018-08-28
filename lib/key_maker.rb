## key_maker.rb

require 'pry'
require 'date'

class KeyMaker

  def generate_key_number
   rand(10 ** 5).to_s.rjust(5, "0")
  end

end
