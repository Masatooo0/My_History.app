class Reason < ApplicationRecord
  belongs_to :history
  validates :history, presence: true
  validates :reason, presence: true, length: { maximum: 100}
end
