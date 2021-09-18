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
      end
      user = User.where(first_name: row[0])
      group = Group.where(title: row[2])
      GroupMember.create(role: row[3], user_id: user)

    end
  
  end
  
end
