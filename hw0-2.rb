def hello(name)
  "Hello, " + name
end
def starts_with_consonant?(s)
  return true if s =~ /\A(?=[^aeiou])(?=[a-z])/i
  return false
end
def binary_string_multiple_of_4?(s)
	return true if s =~ /(^[0,1]*00$)/
	return false
end
