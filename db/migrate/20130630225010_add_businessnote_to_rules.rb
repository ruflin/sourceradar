class AddBusinessnoteToRules < ActiveRecord::Migration
  def change
    add_column :rules, :businessnote, :string
  end
end
