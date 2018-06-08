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
  main_image = element.search('.offer-item-image .img-cover').map{ |n| n['style'][/url\((.+)\)/, 1] }m[0]

  nodeset = element.css('a')
  array_of_links = nodeset.map {|x| x["href"]}.compact
  item_link = array_of_links.select{ |i| i[/^https:\/\/www.imovirtual.com\/anuncio\//] }[0]

    item_html_file = open(item_link).read
    item_html_doc = Nokogiri::HTML(item_html_file)


    characs = item_html_doc.search('.dotted-list li').text
    description = item_html_doc.search('.text-contents div p')[2].text

    secondary_images = item_html_doc.search('.slider-for img').each do |img|
      img << z['src']
    end





  puts "#{title}  -   #{item_link}"






  announces << {:title => title,
                :subtitle => subtitle,
                :price => price,
                :rooms => rooms,
                :area => area,
                :price_per_meter => price_per_meter,
                :main_image => main_image,
                :characs => characs,
                :description => description,
                :secondary_images => secondary_images
                }


end




