class LinkedListItem
#single-line comment in ruby starts with pound sign

# attr_reader :payload  creates function like
#     def payload
#        @payload
#     end
# this function lets you get the value of
# instance-variable payload

#attr_writer :something creates function like
#   def something=(value)
#      @something=value
#  end
#this function sets the value of
# variable something
# NOTE: in ruby the equal sign is part of the method name, and is different from a method
# name without equal sign

# attr_accessor :apples creates  both attr_writer and attr_reader functions for apples

#you can do a series e.g. attr_accessor :apples, :oranges,

# by default a ruby method returns the value of the last expression,  or the last condition
  include Comparable

  attr_reader :next_list_item

  def next_list_item=(value)  #attr_writer, parenthesis
    @next_list_item = value
    # if next_list_item is myself, raise ArgumentError
    raise ArgumentError if next_list_item.object_id == self.object_id
    # self is the object which is running this method; similar to JS 'this'
    # if error raised, a break occurs (need to have a try-catch)
  end

  def next_list_item_no_ArgumentError=(value)
    @next_list_item = value
  end

  # def next_list_item #attr_reader method
  #   @next_list_item
  # end

  attr_accessor :payload


  # def payload #attr_reader, returns the value of @payload
  #   @payload
  # end

  def initialize(payload)
      #initialize function creates the object and sets instance variables
      @payload  = payload
  end

  def last?
    # the linked list item is last if it doesn't have a next_list_item
    # return true if self.next_list_item == nil
    self.next_list_item.nil?
    # this was refactored--ruby automatically returns the last expression
  end

  def <=>(another)
    if (payload.class ==Symbol and another.payload.class==String)
      #returning +1 to signify symbol > string
      +1
    elsif (payload.class==String and another.payload.class==Symbol)
      #returning -1 to signify string < symbol
      -1
    elsif (payload.class==Fixnum and another.payload.class==String)
      # returning -1 to signify Fixnum < String
      # Fixnum is class of integers
      -1
    elsif (payload.class==String and another.payload.class==Fixnum)
      # returning +1 to signify String > Fixnum
      # Fixnum is class of integers
      +1
    elsif (payload.class==Symbol and another.payload.class==Fixnum)
      #returning +1 to signify symbol > fixnum
      +1
    elsif(payload.class==Fixnum and another.payload.class==Symbol)
      #returning -1 to signify fixnum < symbol
      -1
    else
      payload <=> another.payload
    end
  end

  def ===(another)
    # in this class Eliza wants triple equals to mean equality
    self.object_id == another.object_id
    # putting TRIPLE equals here gives a SystemStackError
    # because was in an infinite loop because self-referential
    # e.g. using === in a function that defines ===
  end
end

# LinkedListItem.new("foo").payload => "foo"   #creates a new object with value "foo"
# then gets "foo" value

#LinkedListItem.new.something = "bar"

