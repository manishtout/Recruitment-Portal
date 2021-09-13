class Candidate < ApplicationRecord
  belongs_to :user
  has_many :reports
  validates :name, presence: true, format: { with: /[a-zA-Z]/, message: "only allow letters"}
  validates :email, presence: true, uniqueness: true, format: { with: /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :passout_year, presence: true, format: { with: /\d{4}/, message: "only allow digits"}
  validates :phone_number, presence: true, format: { with: /\d{10}/, message: "only allow digits and must 10 digits"}
  validates :user_id, presence: true
end
