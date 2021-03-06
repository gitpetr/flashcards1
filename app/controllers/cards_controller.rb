class CardsController < ApplicationController
  before_action :set_card, except: [:index, :new, :create]

  def index
    @cards = Card.all
  end

  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new card_params
    if @card.save
      redirect_to @card
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @card.update card_params
      redirect_to @card
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to cards_path
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:original, :translated, :review)
  end
end
