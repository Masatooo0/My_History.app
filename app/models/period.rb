class Period < ApplicationRecord
  has_many :histories, dependent: :destroy

end
