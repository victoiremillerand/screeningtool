require 'open-uri'
require 'nokogiri'

# startuptoshow = Startup.where(name: @startup.name)
startuptoshow = Startup.last
name = startuptoshow.name

# url = "https://www.crunchbase.com/organization/#{name}"
url = "https://www.welcometothejungle.co/companies/#{name}"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)


counter = 0
element = []
html_doc.search('.sc-laTMn.fxLISD').each do |elt|
  if counter<2
    element << elt.text.strip
    counter += 1
  end
end


creation = element[0]
effectif = element[1]
startuptoshow.update(creation: creation)
startuptoshow.update(people: effectif)


counter = 0
city_array = []
html_doc.search('.sc-cbkKFq.eeLAkK').each do |elt|
 if counter<2
    city_array << elt.text.strip
    counter += 1
  end
end

city = city_array[1]
startuptoshow.update(address: city)

puts creation
puts effectif
puts city

counter = 0
description_array = []
html_doc.search('.sc-iQNlJl.hRSbQZ p').each do |elt|
  if counter < 1
    description_array << elt.text.strip
    counter += 1
  end
end
description = description_array[0]
puts description
startuptoshow.update(activity: description)
