class AddNameToBillings < ActiveRecord::Migration[6.0]
  def change
    add_column :billings, :name, :string
  end
end
