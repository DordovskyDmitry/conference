class ChangeWorkPlaceFromStringToText < ActiveRecord::Migration
  def self.up
    change_column :users, :place_of_work, :text
  end

  def self.down
    change_column :users, :place_of_work, :string
  end
end
