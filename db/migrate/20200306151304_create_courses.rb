class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :address
      t.integer :par
      t.integer :yardage

      t.timestamps
    end
  end
end
