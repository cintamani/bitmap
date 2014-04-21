require 'spec_helper'
require 'dsl_helper'

describe 'Pixel Colour' do
  before do
    create_coloured_image
  end

  it "colour one pixel" do
    assert_one_pixel_coloured
  end

  it "colour a vertical segment" do
    assert_vertical_segment_coloured
  end

  it "colour an horizontal segment" do
    assert_horizontal_segmanet_coloured
  end
end