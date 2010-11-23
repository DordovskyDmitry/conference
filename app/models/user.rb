class User < ActiveRecord::Base
  has_one :report
  has_one :address

  accepts_nested_attributes_for :report
  accepts_nested_attributes_for :address
  
  validates_associated :report, :address
  validates_presence_of :first_name, :last_name, :place_of_work, :position

  delegate :section, :to => :report

  def self.for_program
    self.includes(:report).where('reports.begin_report is not null and reports.end_report is not null').
                  order('reports.begin_report').group_by(&:section).
                  map{|k,v| {k => v.group_by(&:date_for_group)}}.inject({}){|sum,x|sum.merge(x)}
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def date_for_group
    report.begin_report.beginning_of_day.strftime('%d-%m-%Y') if report.begin_report
  end
end
