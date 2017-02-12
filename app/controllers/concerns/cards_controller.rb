class CardsController < ApplicationController
  
  def index
  	@cards = Card.all # список всех карточек
  end

  def new
    @card = Card.new
  end
  
  def show
    @card = Card.find(params[:id]) #показывает карточку
  end
  
  def edit
  	@card = Card.find(params[:id]) #редактирование карточки
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
  	@card = Card.find(params[:id])
  	if @card.update(card_params)
  		redirect_to @cards
  	else
  		render 'edit'
    end
  end

  def destroy
  	@card = Card.find(params[:id])
  	@card.destroy

  	redirect_to cards_path
  end

  
private 
   def  card_params
     params.require(:card).permit(:translated_text, :original_text, :review_date)     
   end
end