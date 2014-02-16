class Dessert
  attr_reader :name
  attr_writer :name
  attr_reader :calories
  attr_writer :calories
  def initialize(name, calories)
    @name = name
	@calories = calories
  end
  def healthy?
    return true if calories < 200
  	return false
  end
  def delicious?
    return true
  end
end

class JellyBean < Dessert
  attr_reader :flavor
  attr_writer :flavor
  def initialize(flavor)
    @flavor = flavor
	super(flavor + " jelly bean", 5)
  end
  def delicious?
	if flavor == "licorice"
	  return false
	else
	  return true
	end
  end
end

