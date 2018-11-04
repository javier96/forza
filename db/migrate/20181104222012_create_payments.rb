class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.float :amount
      t.date :date
      t.references :member_id, foreign_key: true

      t.timestamps
    end
  end
end
