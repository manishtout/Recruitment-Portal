class CreateCandidates < ActiveRecord::Migration[6.1]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :email
      t.integer :passout_year

      t.timestamps
    end
  end
end
