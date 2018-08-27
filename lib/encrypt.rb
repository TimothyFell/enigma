require './lib/enigma'
require 'date'
require 'pry'

# Take in the args
orig_msg_filename, encrypted_filename = ARGV

# open the files
message_file = open("./lib/#{orig_msg_filename}", 'r')
encrypted_file = open("./lib/#{encrypted_filename}", 'w')

# get and store the message to be encrypted
message = message_file.read.strip

# create a new enigma
e = Enigma.new

# encrypt and write the message
encrypted_message = e.encrypt(message)
encrypted_file.write(encrypted_message)
puts "Created '#{encrypted_filename}' with the key #{e.key} and date #{Date.today.strftime("%d%m%y")}"

# close both files
encrypted_file.close
message_file.close
