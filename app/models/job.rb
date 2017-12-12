class Job < ApplicationRecord
  belongs_to :owner_profile
  # Added
  has_many :worker_profiles, through: :requests
  has_many :requests
end
