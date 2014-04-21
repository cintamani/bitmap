#!/usr/bin/env ruby

require_relative '../lib/bitmap'

proxy = Bitmap::Proxy.new

loop do
  begin
    proxy.process_input(gets.strip.split)

    puts proxy.map_content if proxy.print?
    break if proxy.exit?
  rescue Bitmap::InvalidInput
    puts "Please use numbers between 0 and 251 only."
  end
end