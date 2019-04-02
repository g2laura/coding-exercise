class OffersController < ApplicationController
  before_action :set_offers, except: %i[new edit]

  def index
  end

  def new
    @offer = Offer.new
  end

  def edit
    @offer = Offer.find_by(id: params[:id])
  end

  def create
    @offer = Offer.new(update_params)
    if @offer.save
      render action: :index
    else
      @offer.valid?
      render action: :new, status: :unprocessable_entity
    end
  end

  def update
    @offer = Offer.find_by(id: params[:id])
    if @offer.update(update_params)
      render action: :index
    else
      render action: :edit, status: :unprocessable_entity
    end
  end

  def destroy
    Offer.find_by(id: params[:id]).destroy
    render action: :index
  end

  private
  def update_params
    params.require(:offer).permit(:grade, :season, :price, :quantity)
  end

  def set_offers
    @offers = Offer.all
  end
end
