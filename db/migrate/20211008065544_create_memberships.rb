class CreateMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :memberships do |t|
      t.references :employer, foreign_key: true
      t.references :users, foreign_key: true
      t.references :roles, foreign_key: true
      t.timestamps
    end
  end
end
