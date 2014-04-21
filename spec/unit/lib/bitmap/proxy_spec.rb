require 'spec_helper'

describe Bitmap::Proxy do
  subject { Bitmap::Proxy.new }

  describe '#process_input' do
    it "assign received command" do
      subject.process_input(['foo', 'bar', 'baz'])

      command = subject.instance_variable_get(:@command)
      expect(command).to eq("foo")
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
    context "when command is 'exit'" do
      before do
        subject.process_input(['exit'])
      end

      it 'return true' do
        expect(subject.exit?).to be_true
      end
    end

    context "when command is not 'exit'" do
      it 'return false' do
        expect(subject.exit?).to be_false
      end
    end
  end
end
