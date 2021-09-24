class Candidate < ApplicationRecord
  belongs_to :user
  has_many :reports
  has_one_attached :document_pdf
  has_one_attached :avatar
  validates :avatar, presence: true
  validates :document_pdf, presence: true, blob: {content_type: ["application/pdf","application/vnd.openxmlformats-officedocument.wordprocessingml.document"]}
  validates :name, presence: true, format: { with: /[a-zA-Z]/, message: "only allow letters"}
  validates :email, presence: true, uniqueness: true, format: { with: /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :passout_year, presence: true, format: { with: /\d{4}/, message: "only allow digits"}
  validates :phone_number, presence: true, format: { with: /\d{10}/, message: "only allow digits and must 10 digits"}
  validates :user_id, presence: true
  validate :image_validation?

  def image_validation?
    if !document_pdf.content_type.in? (%("image/jpeg" "image/png" "image/jpg"))
      errors.add(:avatar, "File must be jpeg, png or jpg")
    end  
  end  
end

