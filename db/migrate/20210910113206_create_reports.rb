class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :status
      t.integer :interview_number
      t.string :feedback
      t.string :interviewer_name
      t.integer :candidate_id

      t.timestamps
    end
  end
end
