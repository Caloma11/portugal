require 'open-uri'
require 'nokogiri'


url = 'https://www.imovirtual.com/agencia/?q=&search%5Bcategory_id%5D=1&shop=Mqt'
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)


announces = []



html_doc.search('.offer-item').each do |element|
  title = element.search('.offer-item-title').text
  subtitle = element.search('header p').text
  price = element.search('.offer-item-price').text.strip



  rooms = element.search('.offer-item-rooms').text.strip
  area = element.search('.offer-item-area').text.strip
  price_per_meter = element.search('.offer-item-price-per-m').text.strip
  main_image = element.search('.offer-item-image .img-cover').map{ |n| n['style'][/url\((.+)\)/, 1] }[0]

  nodeset = element.css('a')
  array_of_links = nodeset.map {|x| x["href"]}.compact
  song_link = array_of_links.select{ |i| i[/^https:\/\/www.imovirtual.com\/anuncio\//] }


  puts "#{title}  -   #{song_link}"






  announces << {:title => title,
                :subtitle => subtitle,
                :price => price,
                :rooms => rooms,
                :area => area,
                :price_per_meter => price_per_meter,
                :main_image => main_image
                }


end




