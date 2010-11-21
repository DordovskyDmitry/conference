class User < ActiveRecord::Base
  has_one :report
  has_one :address

  accepts_nested_attributes_for :report
  accepts_nested_attributes_for :address
  
  validates_associated :report, :address
  validates_presence_of :first_name, :last_name, :place_of_work, :position

  delegate :section, :to => :report

  def full_name
    "#{first_name} #{last_name}"
  end

  def date_for_group
    self.report.begin_report.beginning_of_day.strftime('%d-%m-%Y')
  end
end
