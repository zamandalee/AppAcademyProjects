# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint(8)        not null, primary key
#  short_url  :string           not null
#  long_url   :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord
  validates :user_id, :short_url, :long_url, presence: true
  
  def self.random_code 
    rand_str = SecureRandom.urlsafe_base64
    
    while ShortenedUrl.exists?(short_url: rand_str)
      rand_str = SecureRandom.urlsafe_base64
    end 
    
    return rand_str
  end 
  
  def self.create!(user, long_url)
    ShortenedUrl.new(user_id: user.id, short_url: ShortenedUrl.random_code, long_url: long_url)
  end 
  
  def num_clicks #count number of clicks on a ShortenedUrl
    shortened_urls.select(:user_id).count
  end
  
  def num_uniques #number of distinct users who have clicked
    shortened_urls.select(:user_id).distinct.count
  end
  
  def num_recent_uniques
    # shortened_urls.where("updated_at = ")
    # shortened_urls.select(:user_id).distinct.count
  end
  
  belongs_to :submitter, 
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
    
  has_many :visits,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :Visit
    
  has_many :visitors,
    Proc.new { distinct }, #scope block Rails removes dups
    through: :visits,
    source: :user
    
end
