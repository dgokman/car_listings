class CreateAnotherCarsTable < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :manufacturer_id, null: false
      t.string :color, null: false
      t.date :year, null: false
      t.integer :mileage, null: false
      t.text :description
    end
  end
end
