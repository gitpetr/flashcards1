class HomeController < ApplicationController
  def index
    @take_card = Card.for_review ? Card.for_review.take : Card.all.take
    # @take_card = Card.all.take
    # @take_card = Card.for_review.take
  end

  def update
    @card = Card.find(params[:id])
    if @card.comparison(params[:text])
      redirect_back(fallback_location: root_path,  success: 'угадал')
    else
      redirect_back(fallback_location: root_path, danger: 'извините, неправильно')
    end
  end
end
