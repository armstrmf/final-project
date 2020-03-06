# == Schema Information
#
# Table name: recommendations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer
#  golfer_id  :integer
#

class Recommendation < ApplicationRecord

  belongs_to :golfer
  belongs_to :course

  validates :golfer_id, :presence => true
  validates :course_id, :presence => true
end
