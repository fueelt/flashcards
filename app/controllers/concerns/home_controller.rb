class HomeController < ApplicationController
	before_action :show_card, except: [:index, :new, :create]

	def index
	end
 
    def show
      @card = Card.find(params[:id])
    end
  
    def edit
    end 

private 
  
    def show_card
      @card = Card.find(params[:id])
    end 

    def card_params
      params.require(:card).permit(:translated_text, :original_text, :review_date)     
    end
end