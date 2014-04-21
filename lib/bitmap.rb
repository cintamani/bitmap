module Bitmap
  class Bitmap
    attr_reader :map

    def initialize(m, n)
      @map = n.times.map do
        m.times.map { 0 }
      end
    end

    def to_s
      @map.map do |row|
        row.join
      end.join("\n")
    end

    def colour_pixel(x, y, colour)
      @map[x][y] = colour if in_map?(x, y)
    end

    def colour_vertical_segment(y, x1, x2, colour)
      if y_in_map?(y) && x_in_map?(x1) && x_in_map?(x2) && x1 <= x2
        x1.upto(x2).each do |x|
          @map[x][y] = colour
        end
      end
    end

    def colour_horizontal_segment(y1, y2, x, colour)
      if y_in_map?(y1) && y_in_map?(y2) && x_in_map?(x) && y1 <= y2
        y1.upto(y2).each do |y|
          @map[x][y] = colour
        end
      end
    end
    private

    def in_map?(x, y)
      x_in_map?(x) && y_in_map?(y)
    end

    def x_in_map?(x)
      0 <= x && x < @map.first.size
    end

    def y_in_map?(y)
      0 <= y && y < @map.size
    end
  end
end