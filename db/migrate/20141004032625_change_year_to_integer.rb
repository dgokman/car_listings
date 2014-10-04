class ChangeYearToInteger < ActiveRecord::Migration
  def change
    remove_column :cars, :year, :date
  end
end
