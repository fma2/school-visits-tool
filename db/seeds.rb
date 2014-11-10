# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'net/http'
require 'uri'

def open(url)
  Net::HTTP.get(URI.parse(url))
end

page_content = open('http://data.cityofnewyork.us/resource/n3p6-zve2.json')