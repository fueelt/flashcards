class CardsController < ApplicationController
  before_action :show_card, except: [:index, :new, :create]

  def index
  	@cards = Card.all
  end

  def new
    @card = Card.new
  end
  
  def show
  end
  
  def edit
  end 
  
  def create
    @card = Card.new(card_params)
  	if @card.save
  	  redirect_to @card #сохранение изменений в базе данных
    else
      render 'new'  
    end
  end

  def update 
  	if @card.update(card_params)
  		redirect_to @cards
  	else
  		render 'edit'
    end
  end

  def destroy
  	@card.destroy
    redirect_to cards_path
  end
  
private 
  
  def show_card
    @card = Card.find(params[:id])
  end 

  def card_params
    params.require(:card).permit(:translated_text, :original_text, :review_date)     
  end
end