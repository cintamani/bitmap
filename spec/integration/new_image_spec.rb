require 'spec_helper'
require 'dsl_helper'

describe "create a new image" do
  it "create a new image of 2 x 3" do
    create_image(2, 3)
    assert_2_x_3_image
  end
end