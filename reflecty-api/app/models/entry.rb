class Entry < ApplicationRecord
  belongs_to :user

  has_many :entry_tags, dependent: :destroy
  has_many :tags, through: :entry_tags
  has_many :ai_analyses, dependent: :destroy
  has_many_attached :attachments
end
