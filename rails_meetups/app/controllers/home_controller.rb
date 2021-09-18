class HomeController < ApplicationController
  def index
  end  
  
  def admin
  end

  def import
    redirect_to root_url, notice: "Thanks for the file upload!"
    data = []
    lines = 0
    CSV.foreach('meetups.csv') do |row|
      data << row
      if Group.where(title: row[2]).empty?
        group = Group.create(title: row[2])
      end
    # for i in data do
    #   puts 'found'
    # end
  end
  
  end
  
end
