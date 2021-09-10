class AddFieldToCandidate < ActiveRecord::Migration[6.1]
  def change
    add_column :candidates, :Phone_number, :string
    add_column :candidates, :user_id, :integer
  end
end
