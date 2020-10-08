class CreateShelter < ActiveRecord::Migration[5.2]
  def change
    create_table :shelters do |t|
      t.string :name
      t.integer :address
      t.string :city
      t.string :state
      t.integer :zip
    end
  end
end