class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.errors.any?
      render :new
    else
      redirect_to recipes_path
    end
  end

  def edit
  end

  def update
    @recipe.update(recipe_params)
    if @recipe.errors.any?
      render :edit
    else
      redirect_to recipe_path(@recipe)
    end
  end

  def destroy
    @recipe.destroy

    redirect_to recipes_path
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
end
