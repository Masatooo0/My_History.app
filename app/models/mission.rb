class Mission < ApplicationRecord
  belongs_to :user
  has_one :notification, dependent: :destroy
end
