class AddFeildToCandidates < ActiveRecord::Migration[6.1]
  def change
    add_reference :candidates, :employer, foreign_key: true
  end
end
