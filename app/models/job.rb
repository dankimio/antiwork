class Job < ApplicationRecord
  enum category: {
    # ui:
  }

  belongs_to :company

  validates :title, presence: true
  validates :description, presence: true
end
