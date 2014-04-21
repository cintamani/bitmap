require_relative "bitmap/proxy"

module Bitmap
  class InvalidInput < StandardError; end

  class Bitmap
    def initialize(m, n)
      @map = n.times.map do
        m.times.map { 0 }
      end
    end

    def to_s
      @map.map do |row|
        row.join(' ')
      end.join("\n")
    end
  end
end