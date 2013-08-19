class Rule < ActiveRecord::Base
  has_one :language
  has_one :vulnerability_impact

  attr_accessible :expression, :businessnote, :technicalnote, :language_id, :vulnerability_impact_id

  validates :expression, presence: true, uniqueness: { scope: :language_id }
  validates :vulnerability_impact_id, presence: true
  validates :businessnote, presence: true
  validates :technicalnote, presence: true
  validates :language_id, presence: true
end
