class CreateDeposits < ActiveRecord::Migration
  def change
    create_table :deposits do |t|
      t.float :amount
      t.references :user, index: true

      t.timestamps
    end
  end
end
