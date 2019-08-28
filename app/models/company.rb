class Company < ApplicationRecord
  validates :email, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  before_save -> { email.downcase! }

  passwordless_with :email
end
