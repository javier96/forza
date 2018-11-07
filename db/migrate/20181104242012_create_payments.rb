class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.float :amount
      t.date :date
      t.belongs_to :member, foreign_key: true

      t.timestamps
    end
  end
end
