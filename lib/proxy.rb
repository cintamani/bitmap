require_relative 'helper'
require_relative 'bitmap'
require_relative 'bitmap/invalid_input'

class Proxy
  include Helper

  def process_input(inputs)
    @command = inputs.shift
    case @command
    when 'I'
      set_matrix_size(inputs)
    when 'L'
      colour_pixel(inputs) if bitmap
    when 'V'
      colour_vertical_segment(inputs) if bitmap
    when 'H'
      colour_horizontal_segment(inputs) if bitmap
    when 'F'
      colour_area(inputs) if bitmap
    when 'C'
      bitmap.clean if bitmap
    end
  end

  def print?
    @command == 'S'
  end

  def exit?
    @command == 'X'
  end

  def map_content
    bitmap.to_s
  end

  private

  attr_reader :bitmap

  def colour_pixel(inputs)
    y, x, colour = *inputs
    y, x = clean_coordinate(y), clean_coordinate(x)

    bitmap.colour_pixel(x, y, colour)
  end

  def colour_vertical_segment(inputs)
    y, x1, x2, colour = *inputs
    y, x1, x2 = clean_coordinate(y), clean_coordinate(x1), clean_coordinate(x2)

    bitmap.colour_vertical_segment(y, x1, x2, colour)
  end

  def colour_horizontal_segment(inputs)
    y1, y2, x, colour = *inputs
    y1, y2, x = clean_coordinate(y1), clean_coordinate(y2), clean_coordinate(x)

    bitmap.colour_horizontal_segment(y1, y2, x, colour)
  end

  def colour_area(inputs)
    y, x, colour = *inputs
    y, x = clean_coordinate(y), clean_coordinate(x)

    bitmap.colour_area(x, y, colour)
  end

  def set_matrix_size(inputs)
    m, n = *inputs

    raise Bitmap::InvalidInput unless valid_sizes?(m, n)

    @bitmap = Bitmap::Bitmap.new(m.to_i, n.to_i)
  end
end