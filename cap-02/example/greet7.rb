#!/usr/bin/env ruby
unless ARGV.first
  puts "Usage: #{$0} FILENAME"
  puts "       FILENAME must contain a list of names."
  exit 1
end

filename = ARGV.first
names = File.readlines(filename)

names.each do |name|
  puts "Hello #{name.chop}!"
end
