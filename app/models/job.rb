class Job < ApplicationRecord
  belongs_to :owner_profile
  # Added
  belongs_to :worker_profile, through: :requests
end
