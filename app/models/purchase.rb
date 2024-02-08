class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :merchandise
  has_one :address
end
