class Company < ApplicationRecord
  has_many :jobs, dependent: :destroy

  validates :email, presence: true
  validates :name, uniqueness: { case_sensitive: false }, allow_blank: true

  before_save -> { email.downcase! }

  passwordless_with :email
end
