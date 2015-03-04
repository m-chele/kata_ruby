class Generation


	def initialize celle = Array.new
		@cells = celle
	end

	def add cell	
		@cells.push cell
	end

	def count
		@cells.count
	end

	def contains cell
		@cells.include? cell
	end


	def next
		livinig_cells = @cells.select { |c| living_neighbours_of(c) > 1 && living_neighbours_of(c) < 4 }		

		dead_cells = []
		@cells.each do |c|			
			dead_neighbours_of(c).each {|d| dead_cells << d}
		end

		seed_cells = dead_cells.select { |c| living_neighbours_of(c) == 3 }

		livinig_cells = livinig_cells + seed_cells

		Generation.new(livinig_cells.uniq)	
	end

	def living_neighbours_of cell
		count = 0
		excluded_cells = @cells.select {|c| c != cell}

		if  excluded_cells.include? Cell.new(cell.x - 1, cell.y - 1)
			count = count + 1 
		end

		if	excluded_cells.include? Cell.new(cell.x - 1, cell.y)    
			count = count + 1 
		end
		if	excluded_cells.include? Cell.new(cell.x - 1, cell.y + 1) 
			count = count + 1 
		end
		if	excluded_cells.include? Cell.new(cell.x, cell.y - 1)  
			count = count + 1 
		end
		if	excluded_cells.include? Cell.new(cell.x, cell.y + 1)  
			count = count + 1 
		end
		if	excluded_cells.include? Cell.new(cell.x + 1, cell.y - 1)
			count = count + 1 
		end
		if	excluded_cells.include? Cell.new(cell.x + 1, cell.y)   
			count = count + 1 
		end
		if	excluded_cells.include? Cell.new(cell.x + 1, cell.y + 1)
			count = count + 1 
		end
		count
	end

	def dead_neighbours_of cell
		excluded_cells = @cells
		dead_cells = Array.new
		cell00 = Cell.new(cell.x - 1, cell.y - 1)
		if  !excluded_cells.include? cell00
			dead_cells.push cell00
		end

		cell01 = Cell.new(cell.x, cell.y - 1)
		if !excluded_cells.include? cell01
			dead_cells.push cell01
		end

		cell02 = Cell.new(cell.x + 1, cell.y - 1)
		if	!excluded_cells.include? cell02
			dead_cells.push cell02
		end


		cell10 = Cell.new(cell.x - 1, cell.y)
		if	!excluded_cells.include? cell10
			dead_cells.push cell10
		end

		cell12 = Cell.new(cell.x + 1, cell.y)
		if	!excluded_cells.include? cell12
			dead_cells.push cell12
		end

		cell20 = Cell.new(cell.x - 1, cell.y + 1)
		if	!excluded_cells.include? cell20
			dead_cells.push cell20
		end

		cell21 = Cell.new(cell.x, cell.y + 1)
		if	!excluded_cells.include? cell21
			dead_cells.push cell21
		end

		cell22 = Cell.new(cell.x + 1, cell.y + 1)
		if	!excluded_cells.include? cell22
			dead_cells.push cell22
		end
		dead_cells
	end


end