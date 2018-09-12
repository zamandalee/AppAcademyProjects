class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :post
  
end
