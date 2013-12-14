class LinkedList

  def initialize
    @first_node
  end

  def add_item(payload)
    #if first_node is not yet a LinkedListItem, then
    # create a new LinkListItem(payload) and assign to first_node
    # JUST CREATE A LIST ITEM WITHOUT CHECKING FIRST

    lli = LinkedListItem.new(payload)
    if @first_node.nil?
      @first_node=lli
    else

    end
    #if first_node is already a LinkedListItem, then
    # find the last item, and add a next item to it? e.g. next_list_item=(value)
  end

  def get(number)
    #later will add if index == 0
    @first_node.payload
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