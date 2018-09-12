# == Schema Information
#
# Table name: post_subs
#
#  id         :bigint(8)        not null, primary key
#  post_id    :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostSub < ApplicationRecord
  validates :post, :sub_id, presence: true
  validates :sub_id, uniqueness: { scope: :post_id }

  belongs_to :post
  belongs_to :sub
end
