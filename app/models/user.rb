class User < ActiveRecord::Base
  attr_accessible :name, :ph_no, :skill1, :skill2, :skill3
end
