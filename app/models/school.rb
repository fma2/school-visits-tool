class School < ActiveRecord::Base
	include PgSearch

	belongs_to :district

	multisearchable :against => [:name, :dbn, :street_address]
end
