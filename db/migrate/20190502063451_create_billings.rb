class CreateBillings < ActiveRecord::Migration[6.0]
  def change
    create_table :billings do |t|
      t.references :user, foreign_key: true, null: false, type: :bigint
      t.references :game, foreign_key: true, null: false, type: :bigint
      t.datetime :billing_date, null: false
      t.integer :amount, null: false
      t.string :image_url
      t.string :note, null: false

      t.timestamps
    end
  end
end
