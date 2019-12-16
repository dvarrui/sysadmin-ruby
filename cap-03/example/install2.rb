#!/usr/bin/env ruby
require 'rainbow'

if ARGV.empty?
  puts "Usage: #{$0} FILENAME"
  puts "       FILENAME is a text file with a list of package names."
  exit 1
end

unless `whoami`.chop == 'root'
  puts Rainbow("[ERROR] Run as \'root\' user!").red.bright
  exit 1
end

packages = `cat #{ARGV.first}`.split("\n")

packages.each do |package|
  ok = system("zypper install -y #{package}")
  unless ok
    puts Rainbow("[ERROR] Package '#{package}' not installed!").red.bright
  end
end
