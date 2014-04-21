require 'open3'

def create_image(x, y)
  stin = %Q{
    I #{x} #{y}
    S
    exit
  }

  @output, @pr_inf = Open3.capture2("bundle exec ruby ./bin/bitmap.rb", stdin_data: stin)
end

def assert_2_x_3_image
  expect(@output).to include("0 0\n0 0\n0 0")
end

def assert_no_error_message_displayed
  expect(@output).to_not include("Please use numbers between 0 and 251 only.")
end

def assert_error_message_displayed
  expect(@output).to include("Please use numbers between 0 and 251 only.")
end