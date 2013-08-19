class TypeOfRule < ActiveRecord::Base
  attr_accessible :type

  validates :type, presence:true, uniqueness: true

end
