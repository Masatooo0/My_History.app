class History < ApplicationRecord
  validates :title, presence: true
  validates :event, presence: true
  validates :motivation, presence: true

  has_many :reasons, dependent: :destroy
  has_one :period, dependent: :destroy
  accepts_nested_attributes_for :reasons, allow_destroy: true
  accepts_nested_attributes_for :period, allow_destroy: true
end
