FactoryGirl.define do
  factory :rule do

=begin
    before(:create) do
      FactoryGirl.create(:language, :name=> 'Java', :file_extension=>'java')
      FactoryGirl.create(:vulnerability_impact, :type=>'low')

      end
=end

    expression "test"
    businessnote "test businessnote"
    technicalnote "test technicalnote"
    #association :language, :factory => :language, :strategy => :create
    #association :vulnerability_impact, :factory => :vulnerability_impact, :strategy => :create

    #TODO: Write a strongly-worded letter to the FactoryGirl creator. THE GOD DAMN FUCKHEAD!
    language_id 0
    vulnerability_impact_id 0



  end


end