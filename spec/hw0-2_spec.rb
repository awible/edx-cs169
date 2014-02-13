require './hw0-2.rb'
describe "hello_world" do
  it "returns_hello_Adrian_when_Adrian_passed" do
    hello("Adrian").should eq("Hello, Adrian")
  end
end
describe "starts_with_consonant" do
  it "returns_true_when_string_begins_with_x" do
    starts_with_consonant?("xabefy").should eq(true)
  end
  it "returns_true_when_string_begins_with_D" do
    starts_with_consonant?("D0000").should eq(true)
  end
  it "returns_false_when_string_begins_with_space" do
    starts_with_consonant?(" D0000").should eq(false)
  end
  it "returns_false_when_string_begins_with_vowel" do
    starts_with_consonant?("e D0000").should eq(false)
  end
end

describe "binary_string_multiple_of_4" do
	it "returns_false_when_string_empty" do
		binary_string_multiple_of_4?("").should eq(false)
	end
	it "returns_false_when_string_has_characters" do
		binary_string_multiple_of_4?("1011a011").should eq(false)
	end
	it "returns_true_when_binary_string_multiple_of_4" do
		binary_string_multiple_of_4?("0110100100").should eq(true)
	end
end
