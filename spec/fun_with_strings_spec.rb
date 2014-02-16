require './lib/fun_with_strings'
#require 'debugger'

describe 'palindrome detection' do
  it 'should work for simple strings' do
    'redivider'.should  be_a_palindrome
    'abracadabra'.should_not  be_a_palindrome
  end
  it 'should be case-insensitive' do
    'ReDivider'.should be_a_palindrome
  end
  it 'should ignore nonword characters' do
    'A man, a plan, a canal -- Panama'.should be_a_palindrome
    "Madam, I'm Adam!".should be_a_palindrome
  end    
end

describe 'remove_leading_whitespace_and_downcase' do
	it 'should remove one leading whitespace and downcase' do 
	  ' ABC'.remove_leading_whitespace_and_downcase.should eq('abc')
	end
	it 'should remove two leading whitespaces and downcase' do
      '  ABC'.remove_leading_whitespace_and_downcase.should eq('abc')
	end
end

describe 'remove_non_letters_except_for_spaces' do
	it 'should keep spaces' do
      'abc abc'.remove_non_letters_except_for_spaces.should eq('abc abc')
	end
	it 'should remove funky characters first row' do
	  'abc ~`!@#$%^&*()_-+='.remove_non_letters_except_for_spaces.should eq('abc ')
	end
	it 'should remove funky characters remaining rows' do
	  'abc [{]}:;<,>.?/'.remove_non_letters_except_for_spaces.should eq('abc ')
	end
end

describe 'remove_multiple_spaces' do
	it 'should remove multiple spaces' do
      'abc  abc'.remove_multiple_spaces.should eq('abc abc')
	end
end

describe 'word count mine' do
  it 'should count abc as one' do
    new_hash = 'abc'.count_words  
	new_hash.length.should eq(1)
	new_hash["abc"].should eq(1)
  end
  it 'should count abc abc ! as two' do
    new_hash = 'abc abc !'.count_words  
	new_hash.length.should eq(1)
	new_hash["abc"].should eq(2)
  end
end

describe 'word count' do
  it 'should work on the empty string' do
    ''.count_words.should == {}
  end
  it 'should return a hash' do
    'now is the time'.count_words.should be_a_kind_of Hash
  end
  it 'works on simple strings' do
    'Doo bee doo bee doo'.count_words.should ==
      {'doo' => 3, 'bee' => 2}
  end
  it 'ignores punctuation' do
    'A man, a plan, a canal -- Panama!'.count_words.should ==
      {'man' => 1, 'plan' => 1, 'canal' => 1, 'a' => 3, 'panama' => 1}
  end
  it 'ignores leading whitespace' do
    "  toucan".count_words.should ==
      {'toucan' => 1 }
  end
  it 'ignores embedded whitespace' do
    "four   four  \n four \t four!".count_words.should ==
      {'four' => 4}
  end
end

describe 'anagram?' do
  it 'should return true for empty string' do
	"".anagram?("").should eq(true)
  end
  it 'should return true for eats and teas' do
	"eats".anagram?("teas").should eq(true)
  end
  it 'should return false for eats and teass' do
	"eats".anagram?("teass").should eq(false)
  end
  it 'should return false for eats and tees' do
	"eats".anagram?("tees").should eq(false)
  end
end

describe 'anagram?' do
  it 'should return true for empty string' do
	"".anagram?("").should eq(true)
  end
end

describe 'my_anagram_groups' do
  it 'should return [[eats teas]] for eats teas' do
	"eats teas".anagram_groups.should eq([["eats", "teas"]])
  end
  it 'should return [[eats teas], [start, tarts] for eats start teas tarts' do
	"eats start teas tarts".anagram_groups.should eq([["eats", "teas"],["start", "tarts"]])
  end
end

describe 'anagram grouping' do
  describe 'sanity checks' do
    it 'should work on the empty string' do
      ''.anagram_groups.should == []
    end
    it 'should return an array of arrays for nonempty string' do
      'x'.anagram_groups.each { |element| element.should be_an Array }
    end
  end
  it 'for "scream cars for four scar creams"' do
    @anagrams =  'scream cars for four scar creams'.anagram_groups
    @anagrams.each { |group| group.sort! }
    [%w(cars scar), %w(four), %w(for), %w(creams scream)].each do |group|
        @anagrams.should include(group)
    end
  end
    
end
