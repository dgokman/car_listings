class ChangeCarsTableNameToManufacturers < ActiveRecord::Migration
  def change
    rename_table :cars, :manufacturers
    rename_column :manufacturers, :manufacturer, :name
  end
end
