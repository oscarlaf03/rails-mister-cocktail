class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :destroy, :update]
  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
    @ingredients_options = Ingredient.all
    @dose_list = Dose.where(cocktail: @cocktail)
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(check_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    @cocktail.update(check_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end



  private

  def check_params
    params.require(:cocktail).permit(:name, :description, :photo, :photo_cache)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
