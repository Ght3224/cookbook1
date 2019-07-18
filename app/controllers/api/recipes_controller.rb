class Api::RecipesController < ApplicationController

  def index 
  if params[:search]
    @recipes = Recipe.where("name LIKE ?", "%#{params[:search]}%")
  else 
    @recipes = Recipe.all 
  end 

  @recipes = @recipes.order(:id => :asc)

    render 'index.json.jb'

  end


  def show 

    the_id = params[:id]

    @recipe = Recipe.find_by(id: the_id)
    #@ingredients
    render 'show.html.erb'
  end 



  def create 
    @recipe = Recipe.new(
      name: params[:name],
      ingredients: params[:ingredients], 
      prep_time: params[:prep_time], 
      user_id: params[:user_id]
      ).save 
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