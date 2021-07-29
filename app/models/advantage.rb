class Advantage < ApplicationRecord
  belongs_to :user
  belongs_to :history, optional: true
  validates :advantage, presence: true
  validates :user, presence: true
end
