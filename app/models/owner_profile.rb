class OwnerProfile < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: true
  # Added
  has_many :jobs

end
