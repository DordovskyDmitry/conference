class Address < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :full_address, :email

  validates_format_of :email,
                      :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                      :message => 'email must be valid'

  validates_format_of :home_phone, :with => /^[0-9]{10}$/,
                      :if => Proc.new { |o| !o.home_phone.blank? }
  validates_format_of :work_phone, :with => /^[0-9]{10}$/,
                      :if => Proc.new { |o| !o.work_phone.blank? }


  before_validation :delete_symbols_from_phone

  private

  def delete_symbols_from_phone
    [work_phone, home_phone].each { |p| p.gsub!(/\D+/, '') }
  end
end
