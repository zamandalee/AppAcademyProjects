# == Schema Information
#
# Table name: responses
#
#  id               :bigint(8)        not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
  validate :not_duplicate_response, :no_self_response
  
  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  
  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice
    
  has_one :question,
    through: :answer_choice,
    source: :question
    
  has_one :poll,
    through: :question,
    source: :poll
    
  has_one :asker,
    through: :poll,
    source: :author
    
  def no_self_response
    if question.poll.author.id == user_id
      errors[:user_id] << 'Author can\'t respond to their own question'
    end
  end
    
  
  def not_duplicate_response #check respondent hasn't alr answered question
    if respondent_already_answered?
      errors[:user_id] << 'This user has already responded to this question'
    end
  end
  
  def respondent_already_answered?
    sibling_responses.exists?(user_id)
  end
  
  def sibling_responses
    question.responses.where.not(id: self.id)
  end
end
