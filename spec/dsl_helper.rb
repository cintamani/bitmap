require 'open3'

## Generate:
## => A0000
## => 00ZZ0
## => 0W000
## => 0W000
## => 0W000
## => 00000
def create_coloured_image
  exec %Q{
    I 5 6
    L 1 1 A
    V 2 3 5 W
    H 3 4 2 Z
    S
    X
  }
end

def assert_one_pixel_coloured
  assert_coloured_image
end

def assert_vertical_segment_coloured
  assert_coloured_image
end

def assert_horizontal_segmanet_coloured
  assert_coloured_image
end

def create_image(x, y)
  exec %Q{
    I #{x} #{y}
    S
    X
  }
end

def assert_2_x_3_image
  expect(@output).to include("00\n00\n00")
end

def assert_no_error_message_displayed
  expect(@output).to_not include("Please use numbers between 0 and 251 only.")
end

def assert_error_message_displayed
  expect(@output).to include("Please use numbers between 0 and 251 only.")
end

def exec(stin)
  @output, @pr_inf = Open3.capture2("bundle exec ruby ./bin/bitmap.rb", stdin_data: stin)
end

def assert_coloured_image
  expect(@output).to include(p"A0000\n00ZZ0\n0W000\n0W000\n0W000\n00000")
end