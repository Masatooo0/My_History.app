class History < ApplicationRecord
  belongs_to :user
  belongs_to :period
  attachment :image
  has_one :advantage, dependent: :nullify
  has_many :reasons, inverse_of: :history, dependent: :destroy
  accepts_nested_attributes_for :reasons, reject_if: :all_blank, allow_destroy: true
  # バリデーション
  validates :title, presence: true, length: { maximum: 25}
  validates :event, presence: true, length: { maximum: 25}
  validates :motivation, presence: true
  validates :summarize, presence: true
  validates :user, presence: true
  validates :period, presence: true
end
