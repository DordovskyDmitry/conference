class User < ActiveRecord::Base
  has_one :report
  has_one :address

  accepts_nested_attributes_for :report
  accepts_nested_attributes_for :address
  
  validates_associated :report, :address

  def full_name
    "#{first_name} #{last_name}"
  end
end
