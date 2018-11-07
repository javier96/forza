class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :phoneNumber
      t.integer :paymentDay
      t.boolean :active
      t.date :nextPaymentDate

      t.timestamps
    end
  end
end
