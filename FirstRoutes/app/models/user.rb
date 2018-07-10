# == Schema Information
#
# Table name: users
#
#  id       :bigint(8)        not null, primary key
#  username :string           not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  
  has_many :pieces,
    foreign_key: :artist_id,
    class_name: :Artwork
    
  has_many :viewers,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare
    
  has_many :shared_artworks,
    through: :viewers,
    source: :artwork
end
