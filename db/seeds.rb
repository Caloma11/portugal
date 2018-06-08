# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'wait while seeding.....'

require 'open-uri'
require 'nokogiri'


urls = ['https://www.imovirtual.com/agencia/?q=&search%5Bcategory_id%5D=1&shop=Mqt',
  'https://www.imovirtual.com/agencia/?q=&search%5Bcategory_id%5D=1&shop=Mqt&page=2',
  'https://www.imovirtual.com/agencia/?q=&search%5Bcategory_id%5D=1&shop=Mqt&page=3']

urls.each do |url|

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
  item_link = array_of_links.select{ |i| i[/^https:\/\/www.imovirtual.com\/anuncio\//] }[0]

    item_html_file = open(item_link).read
    item_html_doc = Nokogiri::HTML(item_html_file)


    characs = item_html_doc.search('.dotted-list li').text
    description = item_html_doc.search('.text-contents div p')[2].text

    secondary_images = []

    item_html_doc.search('.slider-for img').each do |img|
      secondary_images << img['src']
    end






    Realty.create(:title => title,
                  :subtitle => subtitle,
                  :price => price,
                  :rooms => rooms,
                  :area => area,
                  :price_per_meter => price_per_meter,
                  :main_image => main_image,
                  :characs => characs,
                  :description => description,
                  :secondary_images => secondary_images,
                  )


  end

end

puts "--------------------"
puts ""
puts "that was it. You have #{Realty.count} realties in the database."
