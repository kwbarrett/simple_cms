class Subject < ApplicationRecord

  has_many :pages

  scope :visible, -> { where( :visible => true ) }
  scope :invisible, lambda { where( :visible => false ) }
  scope :sorted, -> { order("created_at ASC") }
  scope :newest, lambda { order("created_at DESC") }
  scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"])}

  validates_presence_of :name

end
