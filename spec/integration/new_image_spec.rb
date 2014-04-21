require 'spec_helper'
require 'dsl_helper'

describe "create a new image" do
  it "create a new image of 2 x 3" do
    create_image(2, 3)
    assert_2_x_3_image
  end

  context "values must be between 1 and 250 included" do
    it "when value is a 0" do
      create_image(0, 3)
      assert_error_message_displayed
    end

    it "when value is 250 or 1" do
      create_image(1, 250)
      assert_no_error_message_displayed
    end

    it "when value is 251" do
      create_image(3, 251)
      assert_error_message_displayed
    end
  end
end