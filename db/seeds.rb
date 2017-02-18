
require 'open-uri'
require 'nokogiri'

Card.delete_all

DATA_DIR = "db/fcards"
Dir.mkdir(DATA_DIR) unless File.exists?(DATA_DIR)

BASE_URL = "http://www.languagedaily.com"
LIST_URL = "#{BASE_URL}/learn-german/vocabulary/common-german-words-11"

HEADERS_HASH = {"User-Agent" => "Ruby/#{RUBY_VERSION}"}

page = Nokogiri::HTML(open(LIST_URL))
rows = page.css('#jsn-mainbody > div.com-content > div > div.jsn-article-content > ul')

rows.each do |row|
  hrefs = row.css("li a").map{ |a|   #map захватывает данные url если он содержит languagedaily
    a['href'] if a['href']=~ /^\/learn-german\//
  }.compact.uniq  # compact удаление nil запросы, uniq - удаляет повторяющие данные

  hrefs.each do |href|
    remote_url = BASE_URL + href
    local_fname = "#{DATA_DIR}/#{File.basename(href)}.html"
    
    unless File.exists?(local_fname)
      begin
        vocabulary_content = open(remote_url, HEADERS_HASH).read
      rescue Exception=>e
        sleep 5 # паузы между открытием страниц
      else
        File.open(local_fname, 'w'){|file| file.write(vocabulary_content)}
        puts "\t...Success, saved to #{local_fname}"
      ensure
        sleep 1.0 + rand
      end  
    end 
    list = Nokogiri::HTML(open("#{local_fname}"))
    cards = list.css(".rowB", ".rowA").each do |card|
      original_text = card.css('.bigLetter').text
	  translated_text = card.css('td[3]').text
	  card = Card.create!( original_text: original_text, translated_text: translated_text )
	end
  end 
end 
