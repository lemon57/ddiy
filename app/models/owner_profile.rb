class OwnerProfile < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  # Added
  has_many :jobs

  accepts_nested_attributes_for :user

end
