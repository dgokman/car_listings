class CreateCarsTable < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :manufacturer, null: false
      t.string :country, null: false
    end
  end
end
