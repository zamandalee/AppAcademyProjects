class Album < ApplicationRecord
  validates :title, :year, :studio, presence: true

  belongs_to :band,
    foreign_key: :band_id,
    class_name: :Band
end
