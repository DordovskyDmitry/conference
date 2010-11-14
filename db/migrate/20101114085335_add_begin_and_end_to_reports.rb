class AddBeginAndEndToReports < ActiveRecord::Migration
  def self.up
    add_column :reports, :begin_report, :datetime
    add_column :reports, :end_report, :datetime
  end

  def self.down
    remove_column :reports, :begin_report
    remove_column :reports, :end_report
  end
end
