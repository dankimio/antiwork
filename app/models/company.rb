# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  name       :string
#  website    :string
#  logo       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ApplicationRecord
  has_many :jobs, dependent: :destroy

  validates :email, presence: true
  validates :name, uniqueness: { case_sensitive: false }, allow_blank: true
  validates :website, presence: true, on: :update

  before_save -> { email.downcase! }

  passwordless_with :email

  def self.fetch_resource_for_passwordless(email)
    find_or_create_by(email: email)
  end
end
