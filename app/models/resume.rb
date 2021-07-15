class Resume < ApplicationRecord
  belongs_to :user
  validates :period, presence: true
end
