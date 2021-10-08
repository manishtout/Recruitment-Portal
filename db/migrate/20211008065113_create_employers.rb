class CreateEmployers < ActiveRecord::Migration[6.1]
  def change
    create_table :employers do |t|
      t.string :name
      t.string :email
      t.integer :phone_number

      t.timestamps
    end
  end
end