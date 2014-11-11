class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :dbn
      t.string :total_students
      t.string :lat
      t.string :long
      t.string :boro
      t.string :street_address
      t.string :zip
      t.text :overview
      t.string :website
      t.string :phone_number
      t.string :grade_span_min
      t.string :grade_span_max
      t.text :program_highlights

      t.timestamps
    end
  end
end
