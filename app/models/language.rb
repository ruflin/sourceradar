class Language < ActiveRecord::Base
  attr_accessible :name

  validates :name, uniqueness: true
  validates :name, presence: true
end
