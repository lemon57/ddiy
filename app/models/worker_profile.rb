class WorkerProfile < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: true
   # Added
  has_many :jobs, through: :requests
  has_many :requests
end
