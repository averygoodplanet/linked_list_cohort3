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

  def initialize (payload)
      #initialize function creates the object and sets instance variables
      @payload = payload
  end

  def payload
    @payload
  end

  def next_list_item=value
    @next_list_item=value
  end
end

# LinkedListItem.new("foo").payload => "foo"   #creates a new object with value "foo"
# then gets "foo" value

#LinkedListItem.new.something = "bar"

