require './lib/enigma'
require 'date'
require 'pry'

# Take in the args
encrypted_filename, decrypted_filename, key, date = ARGV

# open the files
encrypted_file = open("./data/#{encrypted_filename}", 'r')
decrypted_file = open("./data/#{decrypted_filename}", 'w')

# get and store the coded_msg to be encrypted
coded_msg = encrypted_file.read.strip

# create a new enigma
e = Enigma.new

# decrypt and write the decoded_msg
date_object = Date.strptime(date, '%d%m%y')
decoded_msg = e.decrypt(coded_msg, key, date_object)
decrypted_file.write(decoded_msg)
puts "Created '#{decrypted_filename}' with the key #{key} and date #{date}"

# close both files
decrypted_file.close
encrypted_file.close
