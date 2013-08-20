# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

rubyLanguage = Language.create(name:"Ruby",file_extension:"rb")

ruleTypeFiltering = TypeOfRule.create(type:"Filtering")

Rule.create(expression:"swapcase!", businessnote:"biz note", technicalnote:"tech note", language_id: rubyLanguage.id, type_of_rule_id: ruleTypeFiltering.id)
Rule.create(expression:"like", businessnote:"biz note", technicalnote:"tech note", language_id: rubyLanguage.id, type_of_rule_id: ruleTypeFiltering.id)