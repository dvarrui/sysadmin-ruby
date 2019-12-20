#!/usr/bin/env ruby

##
# Install OS packages
def install_packages
  system("zypper install -y tree")
  system("zypper install -y nmap")
  system("zypper install -y vim")
end

##
# Remove OS packages
def remove_packages
  system("zypper remove -y tree")
  system("zypper remove -y nmap")
  system("zypper remove -y vim")
end

##
# Choose action from input argument
if ARGV.first == '--install'
  install_packages
elsif ARGV.first == '--remove'
  remove_packages
else
  puts "Usage: #{$0} [--install|--remove]"
  puts ""
  puts "Options: "
  puts "         --install, install packages"
  puts "         --remove, remove packages"
  exit 1
end
