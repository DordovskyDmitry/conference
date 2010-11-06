class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.date :birthday
      t.string :place_of_work
      t.string :position
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end