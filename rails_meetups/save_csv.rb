require 'csv'

data = []

# create list of lists, headers is data[0]
CSV.foreach('meetups.csv') do |row|
    data << row
    user= User.create(first:name: row[0], last_name: row[1])
end


# correlation to rails db??
# @user= User.create(first:name: row[0], last_name: row[1])
# @group_member = GroupMember.create()
# find group (row[3]), if no group:
    # @group = Group.create()


#seems excessive, shouldn't need headers in arrays? 
# headers = nil
# CSV.foreach(('meetups.csv'), headers: true, col_sep: ",") do |row|
#     data << row
# end 

# data = CSV.parse('meetups.csv', :headers => true)
# print data 
# data.each do |row|
#     print "hello"
#     print row
    # check if group exists
        # if it does: pass
    # else: 
    #     create new group & save
    # firstname, lastname = user
    # role, group = member
    

# print data

