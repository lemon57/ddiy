class Request < ApplicationRecord
  belongs_to :job
  belongs_to :worker_profile

  validates :job, presence: true

  validates :worker_profile, presence: true
  # validates :hours, presence: true
end
