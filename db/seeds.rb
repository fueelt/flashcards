
require 'open-uri'
require 'nokogiri'

Card.delete_all
data = Nokogiri::HTML(open("http://www.languagedaily.com/learn-german/vocabulary/common-german-words"))
cards = data.css(".rowB", ".rowA").each do |card|
  original_text = card.css('.bigLetter').text
  translated_text = card.css('td[3]').text
  card = Card.create!(:original_text => original_text, :translated_text => translated_text, :review_date => Date.today )
end

