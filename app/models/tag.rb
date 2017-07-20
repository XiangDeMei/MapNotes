class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :notetags, dependent: :destroy
  has_many :notes, through: :notetags
end
