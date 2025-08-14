class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # devise-jwtが必須とするからのメソッド
  def jwt_payload
  end

  has_many :entries, dependent: :destroy
  has_many :templates, dependent: :destroy
  has_one :subscription, dependent: :destroy
end
