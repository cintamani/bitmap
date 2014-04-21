require 'spec_helper'
require 'dsl_helper'

describe 'Clean map' do
  before do
    create_coloured_image_and_clean_map
  end

  it "colour one pixel" do
    assert_cleaded_area_after_coloured_image
  end
end