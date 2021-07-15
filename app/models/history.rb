class History < ApplicationRecord
  belongs_to :user
  belongs_to :period
  has_one :advantage, dependent: :nullify
  has_many :reasons, inverse_of: :history, dependent: :destroy
  accepts_nested_attributes_for :reasons, reject_if: :all_blank, allow_destroy: true
end
