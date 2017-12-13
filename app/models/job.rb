class Job < ApplicationRecord
  belongs_to :owner_profile
  CATEGORIES = ["Painting", "Plumbing", "Electrics", "Carpentry", "Cleaning", "Handyman", "Other"]
  validates :category, inclusion: {in: CATEGORIES}
  # Added
  has_many :worker_profiles, through: :requests
  has_many :requests
end
