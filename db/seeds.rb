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

districts_data = open('http://data.cityofnewyork.us/resource/g3vh-kbnw.json')
schools_data = open('http://data.cityofnewyork.us/resource/n3p6-zve2.json')

District.destroy_all
School.destroy_all

all_districts = JSON.parse(districts_data)
all_districts.each do |district|
	district_number = district["jurisdiction_name"].split(" ")[1].to_i
	district_borough = district["jurisdiction_name"].split(" ")[2]
	District.create(jurisdiction_name: district["jurisdiction_name"], number: district_number, borough: district_borough )
end

all_high_schools = JSON.parse(schools_data)
all_high_schools.each do |school|
	district = school["dbn"].split("").shift(2).join.to_i
	district_match = District.find_by(number: district)
	district_match.schools << School.create(name: school["school_name"], dbn: school["dbn"], total_students: school["total_students"], lat: school["location_1"]["latitude"],long: school["location_1"]["longitude"], boro: school["boro"], street_address: school["primary_address_line_1"], zip: school["zip"], overview: school["overview_paragraph"], website: school["website"], phone_number: school["phone_number"], grade_span_min: school["grade_span_min"], grade_span_max: school["grade_span_maschool"], program_highlights: school["program_highlights"] )
end
