class Content < ApplicationRecord
  belongs_to :history
  has_many :reasons, dependent: :destroy
  accepts_nested_attributes_for :reasons, allow_destroy: true
end
