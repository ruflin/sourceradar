class Rule < ActiveRecord::Base
  attr_accessible :description, :expression, :language_id

  validates :expression, presence: true, uniqueness: { scope: :language_id }
  validates :description, presence: true
  validates_presence_of :language

  belongs_to :language
end
