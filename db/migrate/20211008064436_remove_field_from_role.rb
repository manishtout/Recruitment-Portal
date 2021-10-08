class RemoveFieldFromRole < ActiveRecord::Migration[6.1]
  def change
    remove_column :roles, :admin, :string
    remove_column :roles, :distributor, :string
    add_column :roles, :character, :string
  end
end
