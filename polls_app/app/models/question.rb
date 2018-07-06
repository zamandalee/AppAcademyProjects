# == Schema Information
#
# Table name: questions
#
#  id         :bigint(8)        not null, primary key
#  text       :text             not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  validates :text, presence: true
  
  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll
  
  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice
    
  has_many :responses,
    through: :answer_choices,
    source: :responses
    
  def results
    #posts = self.posts.includes(:comments)
    #choices = answer_choices.includes(:responses)
    result = {}
    answer_choices.includes(:responses).each do |choice|
      result[choice.text] = choice.responses.length
    end
    result
  end
  
end
