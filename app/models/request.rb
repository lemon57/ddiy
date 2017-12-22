class Request < ApplicationRecord
  belongs_to :job
  belongs_to :worker_profile

  validates :job, presence: true

  validates :worker_profile, presence: true

  PENDING = "Pending"
  QUOTE_SENT= "send quote"

  STATUSES = [QUOTE_SENT, PENDING] # Add the other statuses as well

  def total_price
    worker_profile.price_per_hour * hours.to_i + material_cost
  end

end
