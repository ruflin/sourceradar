class Rule < ActiveRecord::Base
  attr_accessible :description, :keyword, :language_id

  validates :keyword, presence: true, uniqueness: { scope: :language_id }
  validates :description, presence: true
  validates_presence_of :language

  belongs_to :language
end
