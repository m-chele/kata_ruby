class Cell
	attr_reader :custom_unique_id
	attr_reader :x, :y

	def initialize(x, y)
		@x = x
		@y = y

	end

	def ==(cell)
		@x == cell.x && @y == cell.y		
	end

	def eql?(comparee)
		self == comparee
	end


  # Internally, Ruby converts your array
  # objects each into a hash (identifier, 
  # not object), using #hash.  By default
  # this is #object_id.hash, which is no
  # longer appropriate.  The purpose is 
  # to recognize which objects have the 
  # same hash and which do not, thus they 
  # are unique.  So, override.
  def hash
  	custom_unique_id.hash
  end


end