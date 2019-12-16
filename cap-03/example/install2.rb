#!/usr/bin/env ruby
require 'colorize'

if ARGV.empty?
  puts "Usage: #{$0} FILENAME"
  puts "       FILENAME is a text file with a list of package names."
  exit 1
end

unless `whoami`.chop == 'root'
  puts "[ERROR] Run as \'root\' user!".light_red
  exit 1
end

packages = `cat #{ARGV.first}`.split("\n")

packages.each do |package|
  ok = system("zypper install -y #{package}")
  unless ok
    puts "[ERROR] Package '#{package}' not installed!".light_red
  end
end
