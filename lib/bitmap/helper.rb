module Bitmap
  module Helper
    def valid_sizes?(m, n)
      in_range?(m) && in_range?(n)
    end

    def in_range?(x)
      1 <= x.to_i && x.to_i <= 250
    end
  end
end