class Advantage < ApplicationRecord
  has_many :histories
  validates :history_id, presence: true
  validates :advantage, presence: true
end
