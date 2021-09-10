class RenameFiledToCandidate < ActiveRecord::Migration[6.1]
  def change
    rename_column :candidates, :Phone_number, :phone_number
  end
end
