class Job < ApplicationRecord
  # other, ui ux, graphic, animation / motion, illustration, management (creative / art director), brand
  enum category: [
    :ui, :graphic, :motion, :illustration, :branding, :other
  ]
  enum level: [
    :junior, :middle, :senior, :lead
  ]

  belongs_to :company

  validates :title, presence: true
  validates :description, presence: true
end
