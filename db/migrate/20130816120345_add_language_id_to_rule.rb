class AddLanguageIdToRule < ActiveRecord::Migration
  def change
    add_column :rules, :language_id, :integer
  end
end
