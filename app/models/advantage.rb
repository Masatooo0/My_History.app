class Advantage < ApplicationRecord
  belongs_to :user
  belongs_to :history
  validates :history_id, presence: true
  validates :advantage, presence: true
end
