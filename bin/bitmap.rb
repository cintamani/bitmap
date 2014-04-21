#!/usr/bin/env ruby

require_relative '../lib/bitmap'

loop do
  command = gets.strip
  puts "0 0\n0 0\n0 0" if command == "S"
  break if command == "exit"
end