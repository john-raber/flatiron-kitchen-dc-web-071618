class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)

    if @ingredient.errors.any?
      render :new
    else
      redirect_to ingredients_path(@ingredient)
    end
  end

  def edit
  end

  def update
    @ingredient.update(ingredient_params)

    if @ingredient.errors.any?
      render :edit
    else
      redirect_to ingredient_path(@ingredient)
    end
  end

  def destroy
    @ingredient.destroy

    redirect_to ingredients_path
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
