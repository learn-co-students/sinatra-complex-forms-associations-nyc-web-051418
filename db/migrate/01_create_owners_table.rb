class CreateOwnersTable < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :name
      t.integer :pet_id
    end
  end
end
