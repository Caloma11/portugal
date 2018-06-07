
require 'open-uri'
require 'nokogiri'
require 'json'

arr = []

url = 'https://www.imovirtual.com/agencia/?q=&search%5Bcategory_id%5D=1&shop=Mqt#'
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.offer-item').each do |element|
  nodeset = element.css('a')
  array_of_links = nodeset.map {|element| element["href"]}.compact
  song_link = array_of_links.select{ |i| i[/^https:\/\/www.imovirtual.com\/anuncio\//] }
  arr << song_link
end

puts arr
