class Rule < ActiveRecord::Base
  has_one :language
  has_one :type_of_rule

  attr_accessible :expression, :businessnote, :technicalnote, :language_id, :type_of_rule_id

  validates :expression, presence: true, uniqueness: { scope: :language_id }
  validates :businessnote, presence: true
  validates :technicalnote, presence: true
  validates :language_id, presence: true
  validates :type_of_rule_id, presence: true
end
