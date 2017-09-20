require 'httparty'
require 'nokogiri'
require 'json'
require 'pry'
require 'csv'


search = 0
puts "Enter the Search String"
get_search = gets
while search <=50 do
slink = "https://www.google.com/search?q=#{get_search}+profile&start=#{search}&sa=N"

page = HTTParty.get(slink)
search+=10

parse_page = Nokogiri::HTML(page)
#Pry.start(binding)

#=begin

links = Array.new()

parse_page.css('.g').css('.r').map do |a|
	
	links.push(a.children.attribute('href').to_str.partition("=")[2].partition("&")[0])

end



links.each do |item|
	if(item.include?("/in/"))
		puts item
	end
end


#=end
end