require './lib/hw0-3.rb'
describe "book_tests" do
  it "throws_exception_when_ISBN_empty" do
	  expect { BookInStock.new("",0)}.to raise_error(ArgumentError)
	  expect { BookInStock.new("")}.to raise_error(ArgumentError)
  end
  it "throws_exception_when_bad_price" do
	  expect { BookInStock.new("xyz",0)}.to raise_error(ArgumentError)
	  expect { BookInStock.new("xyz")}.to raise_error(ArgumentError)
	  expect { BookInStock.new("xyz",-9.99)}.to raise_error(ArgumentError)
  end
  it "sets_new_isbn_correctly" do
	  book = BookInStock.new("xyz",45.00)
	  book.isbn = "abc"
	  book.isbn.should eq("abc")
  end
  it "sets_new_price_correctly" do
	  book = BookInStock.new("xyz",45.00)
	  book.price = 55
	  book.price.should eq(55.00)
  end
  it "returns_new_price_as_string_with_integer" do
	  book = BookInStock.new("xyz",45)
	  book.price_as_string.should eq("$45.00")
  end
  it "returns_new_price_as_string_correctly_with_one_decimal" do
	  book = BookInStock.new("xyz",45.8)
	  book.price_as_string.should eq("$45.80")
  end
  it "returns_new_price_as_string_correctly_with_two_decimals" do
	  book = BookInStock.new("xyz",45.85)
	  book.price_as_string.should eq("$45.85")
  end
end
