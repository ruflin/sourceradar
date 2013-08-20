class RenameColumnTypeOfRuleInRuleToTypeOfRuleId < ActiveRecord::Migration
  def change
    rename_column :rules, :type_of_rule, :type_of_rule_id
  end
end
