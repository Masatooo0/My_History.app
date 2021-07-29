class Mission < ApplicationRecord
  belongs_to :user
  has_one :notification, dependent: :destroy
  validates :user, presence: true
  validates :content, presence: true, length: { maximum: 30}
  validates :deadline, presence: true
end
