require 'spec_helper'

describe Bitmap::Bitmap do
  subject { Bitmap::Bitmap.new(m, n) }

  describe '#to_s' do
    let(:m) { 2 }
    let(:n) { 3 }

    let(:output) { "0 0\n0 0\n0 0" }

    it "return a formatted string" do
      expect(subject.to_s).to eq(output)
    end
  end
end