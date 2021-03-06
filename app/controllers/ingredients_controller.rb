class IngredientsController < ApplicationController
  layout "ingredient"

  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])    
  end

  def new
    @ingredient = Ingredient.new  
  end

  def edit
    @ingredient = Ingredient.find(params[:id])    
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render 'new'
    end
  end

  def update
    @ingredient = Ingredient.find(params[:id])

    if @ingredient.update(ingredient_params)
      redirect_to @ingredient
    else
      render 'edit'
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy

    redirect_to ingredients_path
  end

  def sum_ingredients
    if params[:ingredient_ids].present?
      ingredients = Ingredient.where(id: params[:ingredient_ids])
      sum = ingredients.sum(&:price)
      @total = sum + (sum * 0.2)
      respond_to do |format|
        format.json { render json: @total }
      end
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :description, :price, :avatar, :active)
  end
end
