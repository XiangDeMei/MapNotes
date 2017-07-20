class Note < ApplicationRecord
  attr_accessor :taglist
  before_save :save_tags
  validates :content, presence: true
  validates :user_id, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true

  belongs_to :user
  has_many :notetags, dependent: :destroy
  has_many :tags, through: :notetags

  private
    def save_tags
      self.tags = taglist.to_s.split(/\s*,\s*/).uniq.map do |name|
        Tag.find_or_create_by(name:name)
      end
    end
end
