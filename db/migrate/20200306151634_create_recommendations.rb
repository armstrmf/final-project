class CreateRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :recommendations do |t|
      t.integer :golfer_id
      t.integer :course_id

      t.timestamps
    end
  end
end
