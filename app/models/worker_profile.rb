class WorkerProfile < ApplicationRecord
  belongs_to :user
   # Added
  has_many :jobs, through: :requests
end
