class AddAvgScoretoGolfers < ActiveRecord::Migration[6.0]
  def change
    add_column :golfers, :avg_score, :decimal
  end
end
