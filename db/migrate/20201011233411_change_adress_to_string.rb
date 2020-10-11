class ChangeAdressToString < ActiveRecord::Migration[5.2]
  def change
    change_column :shelters, :address, :string
  end
end
