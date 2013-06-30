class AddTechnicalnoteToRules < ActiveRecord::Migration
  def change
    add_column :rules, :technicalnote, :string
  end
end
