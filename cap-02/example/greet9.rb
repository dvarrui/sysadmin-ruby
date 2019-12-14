#!/usr/bin/env ruby
unless ARGV.first
  puts "Usage: #{$0} FILENAME"
  puts "       FILENAME must contain a list like this: "
  puts "         Obiwan:hi => Say hello to Obiwan"
  puts "         Vader:bye => Say Bye-bye to Vader"
  puts "         #Yoda:hi  => Ignore Yoda"
  exit 1
end

filename = ARGV.first
lines = %x[cat #{filename} | grep -v '#'].split("\n")

lines.each do |line|
  items = line.split(":")
  puts "Hello #{items[0]}!" if items[1] == 'hi'
  puts "Bye-bye #{items[0]}!" if items[1] == 'bye'
end
