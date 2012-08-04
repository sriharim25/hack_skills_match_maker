class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :ph_no
      t.string :skill1
      t.string :skill2
      t.string :skill3

      t.timestamps
    end
  end
end
