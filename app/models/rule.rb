class Rule < ActiveRecord::Base
  belongs_to :language

  attr_accessible :expression, :businessnote, :technicalnote, :language_id

  validates :expression, presence: true, uniqueness: { scope: :language_id }
  validates :businessnote, presence: true
  validates :technicalnote, presence: true
  validates :language_id, presence: true
end
