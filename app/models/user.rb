class User < ActiveRecord::Base
  has_one :report
  has_one :address
end
