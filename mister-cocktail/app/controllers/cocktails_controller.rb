class CocktailsController < ApplicationController

  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  # GET /cocktails
  def index
    @cocktails = Cocktail.all
  end

  # GET /cocktails/:id
  def show
  end

  # GET /cocktails/new
  def new
    @cocktail = Cocktail.new
  end

  # POST /cocktails
  def create
    @cocktail = Cocktail.new(cocktails_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render 'new'
    end
  end

  # GET /cocktails/:id/edit
  def edit
  end

  # PATCH /cocktails/:id
  def update
    @cocktail.update(cocktails_params)

    redirect_to cocktails_path
  end

  # DELETE /cocktails/:id
  def destroy
    @cocktail.destroy
    render nothing: true, status: 200
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktails_params
    params.require(:cocktail).permit(:name)
  end
end
