class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :admin
      t.string :editor
      t.string :viewer
      t.string :writer
      t.string :distributor

      t.timestamps
    end
  end
end
