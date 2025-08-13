class Tag < ApplicationRecord
  has_many :entry_tags, dependent: :destroy
  has_many :entries, through: :entry_tags

  validates :name, uniqueness: true
end
