class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :destroy]
  def index
    @cocktails = Cocktail.all
  end

  def show
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


  private

  def check_params
    params.require(:cocktail).permit(:name, :description)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
