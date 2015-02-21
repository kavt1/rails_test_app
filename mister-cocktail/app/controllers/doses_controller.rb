class DosesController < ApplicationController
  before_action :find_cocktail, only: [ :new, :create, :destroy ]

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @dose = @cocktail.doses.build(dose_params)
    if @dose.save
      redirect_to cocktails_path  #, notice: 'Dose was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @cocktail.doses.find(params[:id]).destroy
    redirect_to cocktail_path(@cocktail), notice: 'Dose was successfully destroyed.'
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
