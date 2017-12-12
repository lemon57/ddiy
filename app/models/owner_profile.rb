class OwnerProfile < ApplicationRecord
  belongs_to :user
  # Added
  has_many :jobs
end
