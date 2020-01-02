# == Schema Information
#
# Table name: jobs
#
#  id               :bigint           not null, primary key
#  company_id       :bigint           not null
#  title            :string           not null
#  category         :integer
#  salary_min       :integer
#  salary_max       :integer
#  remote           :boolean          default(FALSE)
#  visa_sponsorship :boolean          default(FALSE)
#  city             :string
#  country          :string
#  level            :integer
#  description      :text
#  how_to_apply     :text
#  paid             :boolean          default(FALSE)
#  published_at     :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  employment_type  :integer          default("full_time")
#  apply_url        :string
#

class Job < ApplicationRecord
  EXPIRY_DAYS = 30.days

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

  validates :apply_url, presence: true
  validates :description, presence: true
  validates :salary_min, presence: true, numericality: { greater_than: 0 }
  validates :salary_max,
            numericality: { greater_than_or_equal_to: :salary_min },
            allow_blank: true, if: :salary_min?
  validates :title, presence: true

  scope :active, -> { where('published_at > ?', Time.zone.now - EXPIRY_DAYS) }

  def active?
    published_at > Time.zone.now - EXPIRY_DAYS
  end

  def expires_at
    published_at + EXPIRY_DAYS
  end

  def publish
    TelegramChannelService.new(self).post
    touch(:published_at)
  end
end
