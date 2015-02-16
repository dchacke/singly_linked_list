require 'spec_helper'

RSpec.describe Node do
  let(:node) { Node.new('foo') }

  describe 'Initialization' do
    it 'assigns a value' do
      expect(node.value).to eq 'foo'
    end

    it 'assigns nil to next_node' do
      expect(node.next_node).to be_nil
    end
  end
end
