class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.references :user
      t.text :full_address, :null => false
      t.string :work_phone
      t.string :home_phone
      t.string :email
      t.string :report_method, :default => ''
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
