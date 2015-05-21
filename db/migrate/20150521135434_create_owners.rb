class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :emerg_name
      t.string :emerg_phone

      t.timestamps null: false
    end
  end
end
