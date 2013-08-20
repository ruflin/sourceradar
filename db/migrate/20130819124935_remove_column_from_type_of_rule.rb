class RemoveColumnFromTypeOfRule < ActiveRecord::Migration
  def change
    remove_column :types_of_rules, :time_to_be_fixed
  end
end
