class RemoveDescriptionFromRules < ActiveRecord::Migration
  def up
    remove_column :rules, :description
  end

  def down
    add_column :rules, :description, :text
  end
end
