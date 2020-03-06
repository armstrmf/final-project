# == Schema Information
#
# Table name: golfers
#
#  id              :integer          not null, primary key
#  city            :string
#  email           :string
#  password_digest :string
#  state           :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Golfer < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many :rounds
  has_many :recommendations

  has_many :favorite_courses, :through => :recommendations, :source => :course

  validates :username, :presence => true
  validates :username, :uniqueness => true

  def avg_score
    rounds = Round.all.where({ :golfer_id => self.id})
    num_rounds = Round.all.where({ :golfer_id => self.id}).count

    sum_scores = Round.all.where({ :golfer_id => self.id}).sum(:score)

    if num_rounds == 0
      avg = "No rounds yet"
    else
      avg = sum_scores / num_rounds
    end

    return avg
  end

  def best_score
    pr = Round.all.where({ :golfer_id => self.id}).minimum(:score)
    return pr
  end

end
