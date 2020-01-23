require 'rubygems'
require 'nokogiri'
require 'open-uri'
PAGE_URL = "https://coinmarketcap.com/"


def get_crypto_name_from_html
page = Nokogiri::HTML(open(PAGE_URL))
array_title=[]

html_title = page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr//td[2]//a/@title')

html_title.each do |title|
  array_title << title
  end
return array_title
end

puts get_crypto_name_from_html