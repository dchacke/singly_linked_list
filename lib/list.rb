class List
  attr_reader :head

  def initialize(value)
    @head = Node.new(value)
  end

  def add(value)
    # Prepare to traverse the tree
    current = @head

    # Traverse the tree to the last node
    until current.next_node.nil?
      current = current.next_node
    end

    # Set the last node's next_node to a new node
    current.next_node = Node.new(value)
  end

  def remove(value)
    # Prepare to traverse the tree
    current = @head

    # Traverse the tree to a node with the given value
    while current.next_node && current.value != value
      current = current.next_node
    end

    # If no node with given value found,
    # return nil
    return nil if current.value != value

    # If the head must be deleted, set its next_node
    # as head
    if current == @head
      @head = @head.next_node
    # If the last item must be deleted, set the next_node
    # of the second to last item to nil
    elsif current.next_node.nil?
      # Traverse the tree and find the second to last item
      new_current = @head

      until new_current.next_node == current
        new_current = new_current.next_node
      end

      # Set the second to last item's next_node to nil
      new_current.next_node = nil
    # If some item in the middle must be deleted, set the
    # next_node of the item before to the item after
    else
      # Traverse the tree and find the item before
      new_current = @head

      until new_current.next_node == current
        new_current = new_current.next_node
      end

      # Set the next_node of the item before to two items
      # after
      new_current.next_node = new_current.next_node.next_node
    end
  end

  def node_at(index)
    current = @head
    counter = 0

    while current.next_node && counter <= index
      current = current.next_node
    end

    return nil if counter != index
    return current
  end
end
