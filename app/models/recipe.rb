class Recipe < ApplicationRecord


  def example_method 
    ingredients.split(", ")
  end 

end
