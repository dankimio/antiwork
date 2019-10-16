class Job < ApplicationRecord
  enum category: %i[
    ui graphic motion illustration branding other
  ]
  enum employment_type: %i[
    full_time part_time contract
  ]
  enum level: %i[
    junior middle senior lead
  ]

  belongs_to :company

  validates :title, presence: true
  validates :description, presence: true
end
