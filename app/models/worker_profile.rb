class WorkerProfile < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: true
  SKILL_AREA = ["Builder", "Painter", "Carpenter", "Electrician", "Cleaner", "Handyman", "Other"]
  validates :skill_area, inclusion: {in: SKILL_AREA}
   # Added
  has_many :jobs, through: :requests
  has_many :requests
end
