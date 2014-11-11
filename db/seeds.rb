# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'net/http'
require 'uri'
require 'json'

def open(url)
  Net::HTTP.get(URI.parse(url))
end

page_content = open('http://data.cityofnewyork.us/resource/n3p6-zve2.json')

School.delete_all

all_high_schools = JSON.parse(page_content)
all_high_schools.each do |x|
	School.create(name: x["school_name"], dbn: x["dbn"], total_students: x["total_students"], lat: x["location_1"]["latitude"],long: x["location_1"]["longitude"], boro: x["boro"], street_address: x["primary_address_line_1"], zip: x["zip"], overview: x["overview_paragraph"], website: x["website"], phone_number: x["phone_number"], grade_span_min: x["grade_span_min"], grade_span_max: x["grade_span_max"], program_highlights: x["program_highlights"] )
end

