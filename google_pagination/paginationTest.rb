require 'test/unit'

class PaginationTest < Test::Unit::TestCase

# esempio: 
# http://www.shoppydoo.it/prezzi-tutte_le_categorie-batteria_iphone--p28.html

def test_inner_pages_range
	assert_equal("75..84", paginate(100, 80))
	assert_equal("8..17", paginate(29, 13))
end

def test_lower_bound
	assert_equal("1..10", paginate(10, 3))
end

def test_upper_bound
	assert_equal("20..29", paginate(29, 28))
end



def paginate(total, current)
 	min = current - 5
	if(min < 1) then min = 1 end

	max = min + 9
	if(max > total) then 
		max = total
		min = max - 9
	end
	result = min.to_s + ".." + max.to_s
	return result
end

end