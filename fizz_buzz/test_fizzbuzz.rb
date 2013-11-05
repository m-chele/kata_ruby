
require 'test/unit'

class FizzBuzz

	def initialize
		@rules = Array.new {}
		@rules << RuleOf3And5.new
		@rules << RuleOf3.new
		@rules << RuleOf5.new
		@rules << DefaultRule.new
	end

	def get_string(number)
		@rules.select{|r| r.can_handle(number) == true}.first.get_string()
	end

end

class RuleOf3
	def can_handle(number)
		number % 3 == 0
	end

	def get_string
		"fizz"
	end
end

class RuleOf5
	def can_handle(number)
		number % 5 == 0
	end

	def get_string
		"buzz"
	end
end

class RuleOf3And5
	def can_handle(number)
		number % 3 == 0 && number % 5 == 0
	end

	def get_string
		"fizzbuzz"
	end
end

class DefaultRule
	def can_handle(number)
		@result = number
		true
	end

	def get_string
		@result.to_s
	end
end


class FizzBuzzTest < Test::Unit::TestCase


	def setup
		@fizzbuzz = FizzBuzz.new
	end

	def test_prova
		assert_equal(true, true)
	end

	def test_1_is_1
		assert_equal("1", @fizzbuzz.get_string(1))
	end

	def test_multiple_of_3_are_fizz
		assert_equal("fizz", @fizzbuzz.get_string(3))
		assert_equal("fizz", @fizzbuzz.get_string(12))
	end

	def test_multiple_of_5_are_buzz
		assert_equal("buzz", @fizzbuzz.get_string(5))
		assert_equal("buzz", @fizzbuzz.get_string(20))
	end

	def test_multiple_of_3_and_5_are_fizzbuzz
		assert_equal("fizzbuzz", @fizzbuzz.get_string(15))
	end

end

