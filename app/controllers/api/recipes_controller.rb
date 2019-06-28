class Api::RecipesController < ApplicationController

  def index 

    @recipes = Recipe.all

    render 'index.json.jb'

  end


  def show 

    the_id = params[:id]

    @recipe = Recipe.find_by(id: the_id)

    render 'show.json.jb'
  end 



  def create 
    @recipe = Recipe.new(
      name: params[:input_name],
      ingredients: params[:input_ingredients], 
      prep_time: params[:input_prep_time]).save 
    render 'create.json.jb'
  end 

  def update 

    the_id = params[:id]

    @recipe = Recipe.find_by(id: the_id)
    @recipe.name = params[:input_name]
    @recipe.ingredients = params[:input_ingredients]
    @recipe.prep_time = params[:input_prep_time]
    @recipe.save

    render 'update.json.jb'

  end 


  def destroy 

     the_id = params[:id]

    @recipe = Recipe.find_by(id: the_id)

    @recipe.destroy
    render 'destroy.json.jb'

  end 


end 