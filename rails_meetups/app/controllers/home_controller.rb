class HomeController < ApplicationController
  def index
  end  
  
  def admin
  end

  def import
    redirect_to root_url, notice: "Thanks for the file upload!"
    data = []
    lines = 0
    user = []
    CSV.foreach('meetups.csv') do |row|
      lines = lines + 1
      data << row
      if Group.where(title: row[2]).empty?
        group = Group.create(title: row[2])
      end
      if User.where(first_name: row[0]).empty?
        user = User.create(first_name: row[0], last_name: row[1])
      end
      user = User.where(first_name: row[0]).first
      group = Group.where(title: row[2]).first

      if GroupMember.where(user_id: user.id, group_id: group.id).empty?
        puts 'IF'
        GroupMember.create(role: row[3], user_id: user.id, group_id: group.id)

      else
        # change role in existing member, not currently working 
        puts 'ELSE'
        GroupMember.where(user_id: user.id, group_id: group.id).first().update_attribute(:role, row[3])

      end
    end
  
  end
  
end
