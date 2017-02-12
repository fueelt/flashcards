class Card < ApplicationRecord
	validates :original_text, presence: true
	validates :translated_text, presence: true
	validates :review_date, presence: true

    before_create do
       self.review_date = Date.today.next_day(3) 
    end

	validate :not_equal

    validates_each :translated_text, :original_text do |record, attr, value|
      record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
    end

    def not_equal
      errors.add(:base, 'translated text and original text cannot be equal.') if 
      translated_text == original_text
    end
end