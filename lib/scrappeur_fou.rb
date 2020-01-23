require 'rubygems'
require 'nokogiri'
require 'open-uri'
PAGE_URL = "https://coinmarketcap.com/"



def get_crypto_name_from_html
page = Nokogiri::HTML(open(PAGE_URL))
array_title=[]

html_title = page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr//td[2]//a/@title')


array_title = html_title.to_a

  return array_title
end




def get_crypto_value_from_html
  page = Nokogiri::HTML(open(PAGE_URL))

  array_value=[]

  html_value = page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr//td[4]/a/text()')

  array_value = html_value.to_a
  array_value = html_value.map { |value| value.to_s.delete("$").to_f}

  return array_value
end


def put_arrays_into_hash

  results = Hash.new
  results = get_crypto_name_from_html.zip(get_crypto_value_from_html)

  return results
end

def put_results_into_array

  result_final = []

put_arrays_into_hash.each do |result|

  hash_temp = Hash.new
  hash_temp[result[0]]=result[1]
  result_final << hash_temp
  # en une ligne : result_final << {result[0] => result[1]}
  end

  return result_final

end

def perform

  puts put_results_into_array

end


perform
