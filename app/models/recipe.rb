class Recipe < ApplicationRecord


  def example_method 
    ingredients.split(", ")
  end 



  def prep_time_conversion 
    hours = prep_time.to_i/60 
    minutes = prep_time.to_i%60
    "#{hours.to_s} hours #{minutes.to_s} minutes"
  end 


end 

