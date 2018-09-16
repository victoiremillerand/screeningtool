require 'open-uri'
require 'nokogiri'


class StartupsController < ApplicationController
  def index
    @startups = Startup.all
  end

  def show
    @startup = Startup.find(params[:id])

    # startuptoshow = Startup.where(name: @startup.name)
    # startuptoshow = Startup.last
    nameto = @startup.name.downcase

    # url = "https://www.crunchbase.com/organization/#{name}"
    url = "https://www.welcometothejungle.co/companies/#{nameto}"

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
    @startup.update(creation: creation)
    @startup.update(people: effectif)


    counter = 0
    city_array = []
    html_doc.search('.sc-cbkKFq.eeLAkK').each do |elt|
     if counter<2
        city_array << elt.text.strip
        counter += 1
      end
    end

    city = city_array[1]
    @startup.update(address: city)

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
    @startup.update(activity: description)
  end

  def new
    @startup = Startup.new
  end

  def create
    @startup = Startup.new(startup_params)
    if @startup.save
      redirect_to startup_path(@startup)
    else
      render "new"
    end
  end

  def update
  end

  private

  def startup_params
    params.require(:startup).permit(:name)
  end
end
