class Mission < ApplicationRecord
  belongs_to :user
  has_one :notification, dependent: :destroy
  validates :user, presence: true
  validates :content, presence: true, length: { maximum: 30}
  validates :deadline, presence: true
  validate :deadline_val

  def deadline_val
    return if deadline.blank?
    errors.add(:deadline, "は今日以降のものを選択してください") if deadline < Date.today
  end
end
