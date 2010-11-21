class ChangeInvitationMethodsInAddress < ActiveRecord::Migration
  def self.up
    remove_column :addresses, :report_method
    add_column :addresses, :email_invitation, :boolean, :default => false
    add_column :addresses, :post_invitation, :boolean, :default => false
  end

  def self.down
    remove_column :addresses, :email_invitation
    remove_column :addresses, :post_invitation
    add_column :addresses, :report_method, :string, :default => ''
  end
end
