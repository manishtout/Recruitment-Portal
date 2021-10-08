class User < ApplicationRecord
  has_many :candidates
  has_many :employers, through: :memberships
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable       
end
