module Helper
  def valid_sizes?(m, n)
    in_range?(m) && in_range?(n)
  end

  def in_range?(x)
    1 <= x.to_i && x.to_i <= 250
  end

  def clean_coordinate(x)
    x.to_i - 1
  end
end