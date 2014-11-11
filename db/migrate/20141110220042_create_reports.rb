class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :date
      t.string :school
      t.string :dbn
      t.string :purpose
      t.text :comments
      t.text :next_steps
      t.text :additional_info

      t.timestamps
    end
  end
end
