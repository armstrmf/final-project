class AddReccsToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :reccos, :integer
  end
end
