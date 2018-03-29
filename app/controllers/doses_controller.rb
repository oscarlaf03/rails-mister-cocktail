class DosesController < ApplicationController
  before_action :set_cocktail, only: [:create, :new]
  before_action :set_dose, only: [:destroy]
  # before_action :set_ingredient, only: [:create]

  def new
    @dose = Dose.new
    @ingredients_options = Ingredient.all
  end

  def create
    @dose = Dose.new(check_params)
    @dose.cocktail = @cocktail
    @dose.ingredient = Ingredient.all.sample
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
  end



  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def check_params
    params.require(:dose).permit(:description)
  end


  def set_dose
    @dose = Dose.find(params[:id])
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:ingredient_id])
  end

  def list_ingredients
    list = []
    Ingredient.all.each {|n| list << n.name}
    return list
  end



end
