require 'spec_helper'

RSpec.describe List do
  let(:list) { List.new('foo') }

  describe 'Initialization' do
    it 'initializes a new node and assigns it to the head' do
      expect(list.head).to be_a Node
    end

    it 'assigns the value to the first node' do
      expect(list.head.value).to eq 'foo'
    end
  end

  describe 'Methods' do
    describe '#add' do
      it 'adds a new node and assigns it as next_node to the head' do
        list.add('bar')
        expect(list.head.next_node).to be_a Node
      end

      it 'gives the new node a value' do
        list.add('bar')
        expect(list.head.next_node.value).to eq 'bar'
      end

      it 'traverses through the list to find the last node' do
        list.add('bar')
        list.add('foobar')
        expect(list.head.next_node.next_node.value).to eq 'foobar'
      end
    end

    describe '#delete' do
      context 'head must be deleted' do
        let(:list) { List.new('foo') }

        context 'one node' do
          it 'makes the head nil' do
            list.remove('foo')
            expect(list.head).to be_nil
          end
        end

        context 'more than one node' do
          before { list.add('bar') }

          it 'assigns the next node as head' do
            list.remove('foo')
            expect(list.head.value).to eq 'bar'
          end
        end
      end

      context 'any node in between must be deleted' do
        before do
          list.add('second node')
          list.add('third node')
        end

        it "deletes the second node and assigns the third node as the head's next_node" do
          list.remove('second node')
          expect(list.head.next_node.value).to eq 'third node'
        end
      end

      context 'last node must be deleted' do
        before { list.add('second node') }

        it "deletes the last node and makes the second node's head nil" do
          list.remove('second node')
          expect(list.head.next_node).to be_nil
        end
      end

      context 'value not in list' do
        it 'returns nil' do
          expect(list.remove('not in list')).to be_nil
        end
      end
    end

    describe '#node_at' do
      it 'returns the node at a given index' do
        expect(list.node_at(0).value).to eq 'foo'
      end

      it 'return nil for an index that does not exist' do
        expect(list.node_at(5)).to be_nil
      end
    end
  end
end
