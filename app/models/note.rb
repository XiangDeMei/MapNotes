class Note < ApplicationRecord
  validates :content, presence: true
  validates :user_id, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true

  belongs_to :user
  has_many :notetags
  has_many :tags, through: :notetags
end
