class Group < ApplicationRecord

  validates :title, presence: true

  belongs_to :user,
  primary_key: :id,
  foreign_key: :organizer_id,
  class_name: :User
  
  
  has_many :memberships,
  foreign_key: :group_id,
  class_name: :GroupMember
  
  has_many :members, through: :memberships, source: :member
  end