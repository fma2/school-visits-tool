class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :jurisdiction_name
      t.integer :number
      t.string :borough

      t.timestamps
    end
  end
end
