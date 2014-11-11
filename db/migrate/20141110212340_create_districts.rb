class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :name
      t.string :borough
      t.string :superintendent

      t.timestamps
    end
  end
end
