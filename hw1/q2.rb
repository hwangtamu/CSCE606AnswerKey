class Dessert
  attr_accessor :name
  attr_accessor :calories
  def initialize(name, calories)
    @name     = name 
    @calories =  calories
  end


  def healthy?
    return @calories<200
  end
  def delicious?
    return true
  end
end

class JellyBean < Dessert
 attr_accessor :flavor

 def initialize(flavor)
  @name = flavor + " jelly bean"
  @calories = 5
  @flavor = flavor
 end

  def delicious?
  if @flavor == "licorice"
   return false
  else
   return true
  end 
 end
end