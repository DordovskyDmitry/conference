class Report < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :topic

  SECTION = ['Approximation Theory', 'Fourier Analysis', 'Mapping Theory']
end
