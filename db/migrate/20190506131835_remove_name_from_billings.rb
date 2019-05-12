class RemoveNameFromBillings < ActiveRecord::Migration[6.0]
  def change

    remove_column :billings, :name, :string
  end
end
