class AddReferencesToSchools < ActiveRecord::Migration
  def change
    add_reference :schools, :district, index: true
  end
end
