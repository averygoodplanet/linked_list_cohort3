class LinkedList

  def initialize
    @first_node
  end

  def add_item(payload)
    #if first_node is not yet a LinkedListItem, then
    # create a new LinkListItem(payload) and assign to first_node
    # JUST CREATE A LIST ITEM WITHOUT CHECKING FIRST
    lli = LinkedListItem.new(payload)
    @first_node=lli
    #if first_node is already a LinkedListItem, then
    # find the last item, and add a next item to it? e.g. next_list_item=(value)
  end

  def get(number)
    #later will add if index == 0
    @first_node.payload
  end
end