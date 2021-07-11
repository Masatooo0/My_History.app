class History < ApplicationRecord
  belongs_to :user
  belongs_to :period
  belongs_to :advantage
  has_many :reasons, inverse_of: :history
  accepts_nested_attributes_for :reasons, reject_if: :all_blank, allow_destroy: true
end
