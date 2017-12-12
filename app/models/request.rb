class Request < ApplicationRecord
  belongs_to :job
  belongs_to :worker_profile
end
