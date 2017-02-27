class Card < ApplicationRecord
	validates :original_text, :translated_text,  presence: true
  validate :comparison 

  before_create :set_review_date

  def set_review_date
    self.review_date = 3.days.from_now 
  end
  
	# VALID_REGEX = /\A[a-z]+\z/i 
  #  validates :translated_text, :original_text, format: { with: VALID_REGEX }
    
  def comparison
    if original_text == translated_text
      errors[:base] << 'Original text and translated_text text cannot be equal.' 
    end
  end

end 