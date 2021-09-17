class GroupMember < ApplicationRecord
  validates :role, presence: true

    belongs_to :member,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User
  
    belongs_to :group,
    foreign_key: :group_id,
    primary_key: :id,
    class_name: :Group
  end