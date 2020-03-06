class CreateRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :rounds do |t|
      t.integer :golfer_id
      t.integer :course_id
      t.integer :score
      t.date :date_played
      t.string :tees

      t.timestamps
    end
  end
end
