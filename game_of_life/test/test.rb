require_relative "../lib/cell"
require_relative "../lib/generation"

require "test/unit"

class MyTest < Test::Unit::TestCase

	def setup
		@generation = Generation.new
	end

	def test_cell_exists	
		assert_not_nil Cell.new 0,0
	end

	def test_cell_attributes
		cell = Cell.new 3,6

		assert_equal 3, cell.x
		assert_equal 6, cell.y
	end

	def test_cell_equality
		cell = Cell.new(0,1)	

		assert_equal true, cell == Cell.new(0,1)
		assert_equal false, cell == Cell.new(0,2)
	end

	def test_cell_uniqueness
		a = Array.new()
		a << Cell.new(0,0)
		a << Cell.new(0,1)
		a << Cell.new(0,1)

		assert_equal 3, a.count
		assert_equal 2, a.uniq.count
	end	

	def test_generation_exists
		assert_not_nil @generation
	end

	def test_add_cells_to_generation
		@generation.add Cell.new 0,0
		@generation.add Cell.new 0,1

		assert_equal 2, @generation.count
	end

	def test_generation_contains_cell
		cell = Cell.new(0,1)

		@generation.add cell
		assert_equal true, @generation.contains(Cell.new(0,1))
	end

	def test_neighbours_count
		cell10 = Cell.new 1,0		
		@generation.add Cell.new 0,0
		@generation.add cell10
		@generation.add Cell.new 2,0

		assert_equal 2, @generation.living_neighbours_of(cell10)
	end

	def test_cell_without_neighbours_dies
		@generation.add Cell.new 0,0	

		assert_equal 0, @generation.next.count
	end

	def test_cell_with_one_neighbour_dies		
		@generation.add Cell.new 0,0
		@generation.add Cell.new 0,1

		assert_equal 0, @generation.next.count
	end

	def test_cell_with_two_neighbours_lives		
		@generation.add Cell.new 0,0
		@generation.add Cell.new 0,1
		@generation.add Cell.new 0,2

		assert_equal true, @generation.next.contains(Cell.new 0,1)

	end

	def test_cell_with_three_neighbours_lives		
		@generation.add Cell.new 0,0
		@generation.add Cell.new 0,1
		@generation.add Cell.new 0,2
		cell11 = Cell.new 1,1
		@generation.add cell11

		assert_equal true, @generation.next.contains(cell11)
	end


	def test_cell_with_more_than_three_neighbours_dies
		@generation.add Cell.new 0,1
		@generation.add Cell.new 1,0
		cell11 = Cell.new 1,1
		@generation.add cell11
		@generation.add Cell.new 1,2
		@generation.add Cell.new 2,1

		assert_equal false, @generation.next.contains(cell11)		
	end


	def test_dead_neighbours
		cell11 = Cell.new 1,1
		@generation.add cell11

		assert_equal 8, @generation.dead_neighbours_of(cell11).count
	end

	def test_dead_cell_with_exactly_three_neighbours_born
		@generation.add Cell.new 0,0
		@generation.add Cell.new 0,1
		@generation.add Cell.new 0,2
		
		assert_equal true, @generation.next.contains(Cell.new 1,1)		
	end


end