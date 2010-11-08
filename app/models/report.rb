class Report < ActiveRecord::Base
  belongs_to :user

  SECTION = %w{first second third}
end
