class RenameColumnInRules < ActiveRecord::Migration
  def change
    rename_column :rules, :vulnerability_impact_id, :type_of_rule
  end
end
