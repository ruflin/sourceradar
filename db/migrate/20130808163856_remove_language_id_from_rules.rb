class RemoveLanguageIdFromRules < ActiveRecord::Migration
  def up
    remove_column :rules, :language_id
  end

  def down
  end
end
