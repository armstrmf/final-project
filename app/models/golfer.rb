# == Schema Information
#
# Table name: golfers
#
#  id              :integer          not null, primary key
#  avg_score       :decimal(, )
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

    if self.rounds.count == 0
      avg = "No rounds yet"
      return avg
    else
       return self.rounds.average(:score).round(2)
    end

    # if num_rounds == 0
    #   avg = "No rounds yet"
    # else
    #   avg = sum_scores / num_rounds
    #   avg = avg.round(2)
    # end

    # return avg
  end

  def best_score
    pr = Round.all.where({ :golfer_id => self.id}).minimum(:score)

    if self.rounds.count == 0
      none = "No rounds yet"
      return none
    else
      return pr
    end
    
  end

end
