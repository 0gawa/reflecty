class User < ApplicationRecord
  has_secure_password

  has_many :entries, dependent: :destroy
  has_many :templates, dependent: :destroy
  has_one :subscription, dependent: :destroy
end
