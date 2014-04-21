require 'spec_helper'

describe Bitmap::Bitmap do
  subject { Bitmap::Bitmap.new(m, n) }

  describe '#to_s' do
    let(:m) { 2 }
    let(:n) { 3 }

    let(:output) { "00\n00\n00" }

    it "return a formatted string" do
      expect(subject.to_s).to eq(output)
    end
  end

  describe '#colour_area' do
    let(:m) { 3 }
    let(:n) { 5 }

    let(:map) { [
      [0, 0, 0],
      ['A', 'A', 'A'],
      ['B', 'B', 'B'],
      ['B', 'B', 'B'],
      ['B', 'B', 'B']
    ]}

    before do
      subject.map = [
        [0, 0, 0],
        ['A', 'A', 'A'],
        [0, 0, 0],
        [0, 0, 0],
        [0, 0, 0]]
    end

    it "colour an area" do
      subject.colour_area(3, 2, 'B')

      expect(subject.map).to eq(map)
    end
  end

  describe '#colour_pixel' do
    let(:m) { 2 }
    let(:n) { 2 }

    let(:map) { [[0, 0], [0, 'A']] }

    it "assign colour to map" do
      subject.colour_pixel(1, 1, 'A')

      expect(subject.map).to eq(map)
    end
  end

  describe '#colour_vertical_segment' do
    let(:m) { 3 }
    let(:n) { 3 }

    let(:map) { [[0, 0, 0], [0, 'A', 0], [0, 'A', 0]] }

    it "colour a vertical segment" do
      subject.colour_vertical_segment(1, 1, 2, 'A')

      expect(subject.map).to eq(map)
    end
  end

  describe '#colour_horizontal_segment' do
    let(:m) { 3 }
    let(:n) { 3 }

    let(:map) { [[0, 0, 0], ['A', 'A', 0], [0, 0, 0]] }

    it "colour a vertical segment" do
      subject.colour_horizontal_segment(0, 1, 1, 'A')

      expect(subject.map).to eq(map)
    end
  end
end