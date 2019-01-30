class Section < ApplicationRecord

  belongs_to :page
  has_many :section_edits
  has_many :admin_users, :through => :section_edits

  scope :visible, -> { where( :visible => true ) }
  scope :invisible, lambda { where( :visible => false ) }
  scope :sorted, -> { order("created_at ASC") }
  scope :newest, lambda { order("created_at DESC") }
  scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"])}

  CONTENT_TYPES = ['text', 'HTML']
  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_inclusion_of :content_type, :in => CONTENT_TYPES, :message => "must me one of: #{CONTENT_TYPES.join(', ')}"
  validates_presence_of :content

end
