require_relative 'helper'

module Bitmap
  class Proxy
    include Helper

    def process_input(inputs)
      @command = inputs.shift
      case @command
      when 'I'
        assign_matrix_size(inputs)
      end
    end

    def print?
      @command == 'S'
    end

    def exit?
      @command == 'exit'
    end

    def map_content
      bitmap.to_s
    end

    private

    attr_reader :bitmap

    def assign_matrix_size(inputs)
      m, n = *inputs

      raise InvalidInput unless valid_sizes?(m, n)

      @bitmap = Bitmap.new(m.to_i, n.to_i)
    end
  end
end