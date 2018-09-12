# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birthday    :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
  COLORS = %w(brown black white orange)
  SEX = %w(M F)
  
  validates :birthday, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: COLORS
  validates :sex, inclusion: SEX

  
  def age
    DateTime.now.year - birthday.year
  end
  
  def self.colors 
    COLORS
  end
end
