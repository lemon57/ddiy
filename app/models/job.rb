class Job < ApplicationRecord

  include PgSearch
  multisearchable against: [:category]

  belongs_to :owner_profile
  CATEGORIES = ["Painting", "Plumbing", "Electrics", "Carpentry", "Cleaning", "Handyman", "Other"]
  validates :category, inclusion: {in: CATEGORIES}
  # Added
  has_many :worker_profiles, through: :requests
  has_many :requests

  has_attachments :photos, maximum: 4

  def price
    50
  end

  def price_cents
    price*100
  end

end
