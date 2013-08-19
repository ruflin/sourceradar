FactoryGirl.define do
  factory :rule do

    expression "test"
    businessnote "test businessnote"
    technicalnote "test technicalnote"
    #association :language, :factory => :language, :strategy => :create
    #association :vulnerability_impact, :factory => :vulnerability_impact, :strategy => :create

    #TODO: Write a strongly-worded letter to the FactoryGirl creator. THE GOD DAMN FUCKHEAD!
    language_id 0
    type_of_rule_id 0



  end


end