class CreateWithdrawals < ActiveRecord::Migration
  def change
    create_table :withdrawals do |t|
      t.float :amount
      t.text :reason
      t.references :user, index: true

      t.timestamps
    end
  end
end
