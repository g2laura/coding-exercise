class OffersController < ApplicationController
  def index

  end

  def new
    @offer = Offer.new
  end

  def edit
    @offer = Offer.find_by(id: params[:id])
  end

  def create
    render action: :index
  end

  def update
    Offer.find_by(id: params[:id]).update(update_params)
    render action: :index
  end

  private
  def update_params
    params.require(:offer).permit(:grade, :season, :price, :quantity)
  end
end
