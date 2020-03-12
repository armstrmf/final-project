# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  address     :string
#  course_name :string
#  par         :integer
#  yardage     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Course < ApplicationRecord

  has_many :rounds, :dependent => :destroy
  has_many :recommendations, :dependent => :destroy

  has_many :fans, :through => :recommendations, :source => :golfer

  validates :course_name, :presence => true
  validates :course_name, :uniqueness => true
  validates :address, :presence => true
  validates :address, :uniqueness => true

  def top_rank
    @recommends = self.recommendations.count
  end

end
