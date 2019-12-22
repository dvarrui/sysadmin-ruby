#!/usr/bin/env ruby
require 'colorize'

def check_arguments
  # Check input arguments
  if ARGV.empty? or ARGV.size < 2
    puts "Usage: #{$0} [-c|-d] FILENAME"
    puts "       -c, Create users"
    puts "       -d, Delete users"
    puts "       FILENAME is a text file with a list of user names."
    exit 1
  end
  if %w[-c --create].include? ARGV[0]
    action = :create
  elsif %w[-d --delete].include? ARGV[0]
    action = :delete
  else
    puts "Exec: #{$0}"
    exit 1
  end
  # Check input file exist
  unless File.exist?(ARGV[1])
    puts "[ERROR] File \'#{ARGV.first}\' dosn\'t exist!".light_red
    exit 1
  end
  return action, ARGV[1]
end

def create_users(filename)
  # Check current user
  unless %x[whoami].chop == 'root'
    puts "[ERROR] Run as \'root\' user!".light_red
    exit 1
  end
  # Read input file
  users = %x[cat #{filename}].split("\n")
  # Create users
  users.each do |name|
    # * Create user 'name'
    # * Create home folder as '/home/name'
    # * Set user password to '123456'
    ok = system("useradd #{name}")
    unless ok
      puts "[ERROR] User '#{name}' not created!".light_red
    end
  end
end

action, filename = check_arguments
create_users(filename) if action == :create
delete_users(filename) if action == :delete
