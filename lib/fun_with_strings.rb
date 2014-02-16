module FunWithStrings
  def palindrome?
	  self.downcase.gsub(/[^a-z]/,"") == self.reverse.downcase.gsub(/[^a-z]/,"")
  end
  
  def remove_leading_whitespace_and_downcase
	  self.downcase.gsub(/^[\s]+/,"")
  end

  def remove_non_letters_except_for_spaces
	  self.gsub(/[^a-z|" "]/,"")
  end

  def remove_multiple_spaces
	  self.gsub(/\s{2,}/," ")
  end

  def count_words
	  words = self.remove_leading_whitespace_and_downcase
	  words = words.remove_non_letters_except_for_spaces
	  words = words.remove_multiple_spaces
	  words = words.split(' ') 
	  return_hash = Hash.new
	  words.each do | word |
		if return_hash.has_key?(word) then return_hash[word] += 1
		else return_hash[word] = 1
		end
	  end
	  return_hash
  end

  def anagram?(compare_word)
    return false if self.size != compare_word.size
	return true if 
	  compare_word.chars.group_by(&:chr).map { |k, v| [k, v.size]}.sort ==
	  self.chars.group_by(&:chr).map { |k, v| [k, v.size]}.sort
	false
  end

  def anagram_groups
    words = self.split(" ") 
	anagram_group = Array.new
	words.each do | word |
	  placed = false
	  anagram_group.each do | placed_groups |
	    if placed_groups[0].anagram?(word)
	      placed_groups.push (word)
		  placed = true
		end
	  end
	  if !placed
		anagram_group.push(Array.new([word]))
	  end
	end
	anagram_group
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
