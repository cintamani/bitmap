module Bitmap
  class Bitmap
    attr_accessor :map

    def initialize(m, n)
      @m, @n = m, n

      @map = n.times.map do
        m.times.map { 0 }
      end
    end

    def to_s
      @map.map do |row|
        row.join
      end.join("\n")
    end

    def clean
      @map = @n.times.map do
        @m.times.map { 0 }
      end
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

    def colour_area(x, y, colour)
      if x_in_map?(x) && y_in_map?(y)
        override_colour = @map[x][y]
        @map[x][y] = colour

        colour_adjacent(x, y, override_colour, colour)
      end
    end

    private

    def colour_adjacent(x, y, override_colour, colour)
      adjacent_coordinates = get_adjacent_coordinates(x, y, override_colour)
      adjacent_coordinates.each do |x, y|
        @map[x][y] = colour
        colour_adjacent(x, y, override_colour, colour)
      end
    end

    def get_adjacent_coordinates(x, y, override_colour)
      [
        get_left(x, y, override_colour),
        get_right(x, y, override_colour),
        get_up(x, y, override_colour),
        get_down(x, y, override_colour)
      ].compact
    end

    def get_up(x, y, override_colour)
      y += 1

      if y_in_map?(y) && @map[x][y] == override_colour
        [x, y]
      end
    end

    def get_down(x, y, override_colour)
      y -= 1

      if y_in_map?(y) && @map[x][y] == override_colour
        [x, y]
      end
    end

    def get_right(x, y, override_colour)
      x += 1

      if x_in_map?(x) && @map[x][y] == override_colour
        [x, y]
      end
    end

    def get_left(x, y, override_colour)
      x -= 1

      if x_in_map?(x) && @map[x][y] == override_colour
        [x, y]
      end
    end

    def in_map?(x, y)
      x_in_map?(x) && y_in_map?(y)
    end

    def x_in_map?(x)
      0 <= x && x < @map.size
    end

    def y_in_map?(y)
      0 <= y && y < @map.first.size
    end
  end
end