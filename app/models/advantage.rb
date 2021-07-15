class Advantage < ApplicationRecord
  belongs_to :user
  belongs_to :history
  validates :advantage, presence: true
end
