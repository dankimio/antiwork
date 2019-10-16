class Job < ApplicationRecord
  enum category: %i[
    ui graphic motion illustration branding other
  ]
  enum level: %i[
    junior middle senior lead
  ]

  belongs_to :company

  validates :title, presence: true
  validates :description, presence: true
end
