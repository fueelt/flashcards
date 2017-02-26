
require 'open-uri'
require 'nokogiri'

Card.delete_all

BASE_URL = "http://www.languagedaily.com"
LIST_URL = "#{BASE_URL}/learn-german/vocabulary/common-german-words-11"

HEADERS_HASH = {"User-Agent" => "Ruby/#{RUBY_VERSION}"}

page = Nokogiri::HTML(open(LIST_URL))
rows = page.css('#jsn-mainbody > div.com-content > div > div.jsn-article-content > ul')

rows.each do |row|
  hrefs = row.css("li a").map{ |a|   # map захватывает данные url если он содержит languagedaily
    a['href'] if a['href']=~ /^\/learn-german\//
  }.compact.uniq  # compact удаление nil запросы, uniq - удаляет повторяющие данные

  hrefs.each do |href|
    s_url = BASE_URL + href
    
    list =  Nokogiri::HTML(open(s_url)) #  не работает
    cards = list.css(".rowB", ".rowA")    
      cards.each do |card|             
	    translated_text = card.css('td[3]').text
	    next if !translated_text.nil?
		original_text = card.css('.bigLetter').text
		card = Card.create!( original_text: original_text, translated_text: translated_text )
      end
   end 
 end 
