require './lib/enigma'
require 'date'
require 'pry'

# Take in the args
filename_1, filename_2, key, date = ARGV

# open the files
message_file = open("./lib/#{filename_1}", 'r')
encrypted_file = open("./lib/#{filename_2}", 'w')

# get and store the message to be encrypted
message = message_file.read.strip

# create a new enigma
e = Enigma.new

# encrypt the message
if key == nil && date == nil

  encrypted_message = e.encrypt(message)
  encrypted_file.write(encrypted_message)
  puts "#{encrypted_file.name}, #{e.key}, #{Date.today.strftime("%d%m%y")}"

elsif key == nil

  date_object = Date.strptime(date, "%d%m%y")
  encrypted_message = e.encrypt("#{message}", date_object)
  encrypted_file.write(encrypted_message)
  puts "#{encrypted_file.name}, #{e.key}, #{date_object}"

elsif date == nil

  encrypted_message = e.encrypt("#{message}", key)
  encrypted_file.write(encrypted_message)
  puts "#{encrypted_file.name}, #{key}, #{Date.today.strftime("%d%m%y")}"

else

  date_object = Date.strptime(date, "%d%m%y")
  encrypted_message = e.encrypt("#{message}", key, date_object)
  encrypted_file.write(encrypted_message)
  puts "#{encrypted_file.name}, #{key}, #{date_object}"

end

# write the encrypted message to the new file


# close both files
encrypted_file.close
message_file.close
