class AddForiegnKey < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :candidates, :users
  end
end
