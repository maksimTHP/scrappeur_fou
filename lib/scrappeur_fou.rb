require 'rubygems'
require 'nokogiri'
require 'open-uri'
PAGE_URL = "https://coinmarketcap.com/all/views/all/"



def get_crypto_name_from_html
page = Nokogiri::HTML(open(PAGE_URL))
array_all_crypto_names  = []
  page.xpath("//tr/td[3]/div").each do |name|
  name.text
  #sleep(0.1) #=> décommenter les 2 lignes pour faire de l'affichage 1 par 1
  array_all_crypto_names << name.text
  end
  return array_all_crypto_names
end


def get_crypto_value_from_html
  page = Nokogiri::HTML(open(PAGE_URL))

  array_all_crypto_values = []
  page.xpath("//tr/td[5]/a").each do |value|
  array_all_crypto_values << value.text.delete("$,")
  end
  return array_all_crypto_values
end


def put_arrays_into_hash

  results = Hash.new
  results = get_crypto_name_from_html.zip(get_crypto_value_from_html)

  return results

end

def put_hash_into_result

  result_final = []
  put_arrays_into_hash.each do |result|
  hash_temp = Hash.new
  hash_temp[result[0]]=result[1]
  result_final << hash_temp
end
end


puts put_hash_into_result
