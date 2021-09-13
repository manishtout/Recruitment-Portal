class AddRelationToReport < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :reports, :candidates
  end
end
