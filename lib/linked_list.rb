class LinkedList

  attr_reader :size

  def initialize(*seeds)
    @size = 0

    @first_node
    for i in seeds
      self.add_item(i)
    end
  end

  def add_item(payload)
    #if first_node is not yet a LinkedListItem, then
    # create a new LinkListItem(payload) and assign to first_node
    # JUST CREATE A LIST ITEM WITHOUT CHECKING FIRST

    lli = LinkedListItem.new(payload)
    if @first_node.nil?
      # if there is no first_node in the LinkedList, then
      # assign the node to the first_node
      @first_node=lli
    else
      #if there is already a first_node in the LInkedList, then
      # find the last node, and add the new node as
      # last_node.next_list_item
      last_node = self.last
      last_node.next_list_item = lli
    end
    @size += 1
  end

  def get(number)
    raise IndexError if @first_node == nil
    if number == 0
      @first_node.payload
    elsif number > 0
      #start at first node
      current_node = @first_node
      # if get(1),  will start at first node and make 1 traversal
      for i in 1..number
      #get next list item aka traversing the nodes in the linked list
        raise IndexError if current_node.next_list_item == nil
        current_node = current_node.next_list_item
      end
      #return value of nth node
      current_node.payload
    else
      raise IndexError, "negative index passed to ll.get()"
    end
  end

  def retrieve_node(number)
    raise IndexError if @first_node == nil
    if number == 0
      @first_node
    elsif number > 0
      #start at first node
      current_node = @first_node
      # if get(1),  will start at first node and make 1 traversal
      for i in 1..number
      #get next list item aka traversing the nodes in the linked list
        raise IndexError if current_node.next_list_item == nil
        current_node = current_node.next_list_item
      end
      #return value of nth node
      current_node
    else
      raise IndexError, "negative index passed to ll.get()"
    end
  end

  def last
    if @first_node.nil?
      nil
    else
      #start at the first_node
      current_node = @first_node
      # keep going until you find the last node
      # the last node if the node whose next_item variable is nil
      until current_node.next_list_item.nil?
        current_node = current_node.next_list_item
      end
      #return current_node
      current_node
    end
  end

  def to_s
    if @first_node.nil?
      display_string = "| |"
    else
      display_string = "| "
      #start at the first_node
      current_node = @first_node
      #until at last node
      # each concatenate node.payload to display_string
      until current_node.next_list_item.nil?
        display_string = display_string + current_node.payload + ", "
        current_node = current_node.next_list_item
      end

      #concatenate last_node.payload to display_string and
      #add trailing " |"
      display_string = display_string + current_node.payload + " |"
    end
  end

  def [](index)
    self.get(index)
  end

  def []=(index, payload) # args for ll[index]=payload
    #find the node at index
    retrieve_node(index).payload=payload
    #assign payload to the node
  end

  def remove(index)
    @size -= 1
    #find the node_to_remove
    node_to_remove = self.retrieve_node(index)
    #retrieve node_to_remove's next_item
    new_next_item = node_to_remove.next_list_item
    #find node_before_node_to_remove
    if index != 0
      node_before_node = self.retrieve_node(index-1)
      #change node_before_node_to_remove's next_item
      # to new_next_item
      node_before_node.next_list_item = new_next_item
    else
      #if the node being removed if @first_node aka index=0
      @first_node = new_next_item
    end
  end

  def indexOf(payload)
    #if no match, return nil
    index = nil

    # search through linked list
    for i in 0..(@size-1)
      # if item's payload matches, store it's index
      if self.get(i) == payload
        index = i
        break
      end
    end
    index
  end
end