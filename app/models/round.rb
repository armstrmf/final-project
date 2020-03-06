# == Schema Information
#
# Table name: rounds
#
#  id          :integer          not null, primary key
#  date_played :date
#  score       :integer
#  tees        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :integer
#  golfer_id   :integer
#

class Round < ApplicationRecord

  belongs_to :golfer
  belongs_to :course

  validates :score, :presence => true
  validates :golfer_id, :presence => true
  validates :date_played, :presence => true
  validates :course_id, :presence => true
end
