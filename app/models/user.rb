class User < ActiveRecord::Base
  has_one :report
  has_one :address

  accepts_nested_attributes_for :report, :address
  validates_associated :report, :address
end
