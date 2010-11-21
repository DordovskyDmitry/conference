class Report < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :topic

  SECTION = %w{first second third}
end
