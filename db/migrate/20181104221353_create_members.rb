class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :firstName
      t.string :lastName
      t.integer :payday
      t.string :mail

      t.timestamps
    end
  end
end
