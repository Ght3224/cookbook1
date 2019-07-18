class User < ApplicationRecord
  has_many :recipes 

  has_secure_password #encrypt, compare login to encruypted
  validates :email, presence: true #niquness: true 
end
