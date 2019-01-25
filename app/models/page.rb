class Page < ApplicationRecord

  belongs_to :subject, {:optional => true }
  has_many :sections
  has_and_belongs_to_many :admin_users

  scope :sorted, -> { order("created_at ASC") }

end
