class BookInStock
	attr_reader :isbn
	attr_writer :isbn
	attr_reader :price
	attr_writer :price
	def initialize (isbn, price) 
		raise ArgumentError if isbn.empty?
		raise ArgumentError if price <= 0.00
		@isbn = isbn
		@price = price
	end
	def price_as_string
		value = @price.to_s
		value = value + ".00" if value =~ /^\d*[^.]\d*$/ 
		value = value + "0" if value =~ /^\d*\.\d{1}$/
		value = "$" + value
	end
end
