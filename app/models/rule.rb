class Rule < ActiveRecord::Base
  attr_accessible :description, :expression, :businessnote, :technicalnote

  validates :expression, presence: true, uniqueness: true
  validates :description, presence: true
end
