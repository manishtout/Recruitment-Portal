class ChangeColumnMembership < ActiveRecord::Migration[6.1]
  def change
    rename_column :memberships, :users_id, :user_id
    rename_column :memberships, :roles_id, :role_id
  end
end
