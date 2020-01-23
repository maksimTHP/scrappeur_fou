require 'rubygems'
require 'nokogiri'
require 'open-uri'
PAGE_URL = "https://coinmarketcap.com/all/views/all/"
page = Nokogiri::HTML(open(PAGE_URL))
#RECUPERATION DES NOMS
array_all_crypto_names  = []
page.xpath("//tr/td[3]/div").each do |name|
  #puts name.text
  #sleep(0.1) => décommenter les 2 lignes pour faire de l'affichage 1 par 1
  array_all_crypto_names << name.text
end
#RECUPERATION DES VALEURS
array_all_crypto_values  = []
page.xpath("//tr/td[5]/a").each do |value|
  #puts value.text.delete("$,")
  #sleep(0.1) => décommenter les 2 lignes pour faire de l'affichage 1 par 1
  array_all_crypto_values << value.text.delete("$,")
end
#MISE EN FORME DU RESULTAT
results = Hash.new
results = array_all_crypto_names.zip(array_all_crypto_values)
#puts "#{results}"
result_final = []
results.each do |result|
  hash_temp = Hash.new
  hash_temp[result[0]]=result[1]
  result_final << hash_temp
  # en une ligne : result_final << {result[0] => result[1]}
end
puts result_final
