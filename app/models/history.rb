class History < ApplicationRecord
  belongs_to :user
  belongs_to :period
  has_many :reasons, dependent: :destroy
  accepts_nested_attributes_for :reasons, allow_destroy: true
end
