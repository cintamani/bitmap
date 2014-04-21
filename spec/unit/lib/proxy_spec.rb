require 'spec_helper'

describe Proxy do
  subject { Proxy.new }

  describe '#process_input' do
    let(:bitmap) { double('bitmap') }

    before do
      subject.stub(:bitmap).and_return(bitmap)
    end

    it 'set received command' do
      subject.process_input(['foo', 'bar', 'baz'])

      command = subject.instance_variable_get(:@command)
      expect(command).to eq('foo')
    end

    it 'colour pixel' do
      expect(bitmap).to receive(:colour_pixel).with(0, 1, 'C')
      subject.process_input(['L', '2', '1', 'C'])
    end

    it "colour vertical segment" do
      expect(bitmap).to receive(:colour_vertical_segment).with(0, 1, 2, 'C')

      subject.process_input(['V', '1', '2', '3', 'C'])
    end

    it "colour area" do
      expect(bitmap).to receive(:colour_area).with(1, 0, 'C')

      subject.process_input(['F', '1', '2', 'C'])
    end

    it "colour horizontal segment" do
      expect(bitmap).to receive(:colour_horizontal_segment).with(0, 2, 0, 'C')

      subject.process_input(['H', '1', '3', '1', 'C'])
    end

    it 'colour matrix size' do
      expect(Bitmap::Bitmap).to receive(:new).with(1, 2)
      subject.process_input(['I', '1', '2'])
    end

    context "not supported matrix size" do
      it 'raise error' do
        expect do
          subject.process_input(['I', '0', '230'])
        end.to raise_error(Bitmap::InvalidInput)
      end
    end
  end

  describe '#print?' do
    context "when command is 'S'" do
      before do
        subject.process_input(['S'])
      end

      it 'return true' do
        expect(subject.print?).to be_true
      end
    end

    context "when command is not 'S'" do
      it 'return false' do
        expect(subject.print?).to be_false
      end
    end
  end

  describe '#exit?' do
    context "when command is 'X'" do
      before do
        subject.process_input(['X'])
      end

      it 'return true' do
        expect(subject.exit?).to be_true
      end
    end

    context "when command is not 'X'" do
      it 'return false' do
        expect(subject.exit?).to be_false
      end
    end
  end
end
