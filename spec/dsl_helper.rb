require 'open3'

## Generate:
## => 0A000
## => 00ZZZ
## => 0WTTT
## => 0WTTT
## => 0WTTT
## => 0WTTT
def create_coloured_image
  exec %Q{
    I 5 6
    L 2 1 A
    V 2 3 6 W
    H 3 5 2 Z
    F 4 4 T
    S
    X
  }
end

def create_coloured_image_and_clean_map
  exec %Q{
    I 5 6
    L 2 1 A
    V 2 3 6 W
    H 3 5 2 Z
    F 4 4 T
    S
    C
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

def assert_area_coloured
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
  expect(@output).to eq("00\n00\n00\n")
end

def assert_no_error_message_displayed
  expect(@output).to_not eq("Please use numbers between 0 and 251 only.\n\n")
end

def assert_error_message_displayed
  expect(@output).to eq("Please use numbers between 0 and 251 only.\n\n")
end

def exec(stin)
  @output, @pr_inf = Open3.capture2("bundle exec ruby ./bin/bitmap.rb", stdin_data: stin)
end

def assert_coloured_image
  expect(@output).to eq("0A000\n00ZZZ\n0WTTT\n0WTTT\n0WTTT\n0WTTT\n")
end

def assert_cleaded_area_after_coloured_image
  expect(@output).to eq("0A000\n00ZZZ\n0WTTT\n0WTTT\n0WTTT\n0WTTT\n00000\n00000\n00000\n00000\n00000\n00000\n")
end