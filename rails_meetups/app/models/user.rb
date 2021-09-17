class User < ApplicationRecord
    validates :firstName, presence: true #must be present
    validates :lastName, presence: true # must be present
  
    foreign_key: :user_id,
    class_name: :GroupMember,
    dependent: :destroy
  
    foreign_key: :user_id,
    class_name: :EventMember,
    dependent: :destroy
  
    has_many :groups, through: :group_followed, source: :group

  end
  