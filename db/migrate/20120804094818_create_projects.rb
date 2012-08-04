class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :skill1
      t.string :skill2
      t.string :skill3

      t.timestamps
    end
  end
end
