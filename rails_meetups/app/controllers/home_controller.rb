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
        # puts row[0]
        user = User.create(first_name: row[0], last_name: row[1])
        puts user, 'IF'
      end
      user = User.where(first_name: row[0]).first
      group = Group.where(title: row[2]).first
      GroupMember.create(role: row[3], user_id: user.id, group_id: group.id)
      # puts user
      # puts group

    end
  
  end
  
end
