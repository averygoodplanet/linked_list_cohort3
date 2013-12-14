class LinkedList

  attr_reader :size

  def initialize
    @first_node
    @size = 0
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
      last_node = self.find_last_node
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
    elsif number < 0
      raise IndexError, "negative index passed to ll.get()"
    else
    end
  end

  def find_last_node
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