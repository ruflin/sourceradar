class RenameTableTypeOfRule < ActiveRecord::Migration
  def change
    rename_table :types_of_rules, :type_of_rules
  end
end
