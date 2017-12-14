class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :worker_profile
  has_one :owner_profile
  has_many :worker_profiles

  def is_worker?
    self.worker_profile ? true : false
  end

  def is_owner?
    self.owner_profile ? true : false
  end
end
