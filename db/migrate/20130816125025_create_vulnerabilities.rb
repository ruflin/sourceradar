class CreateVulnerabilities < ActiveRecord::Migration
  def change
    create_table :vulnerabilities do |t|
      t.string :file
      t.integer :loc
      t.string :who_commited_it?
      t.integer :points
      t.string :description

      t.timestamps
    end
  end
end
