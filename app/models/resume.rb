class Resume < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :period, presence: true
  validates :content, presence: true, length: { maximum: 50}
  validates :status, inclusion:{in: [true, false]}
end
