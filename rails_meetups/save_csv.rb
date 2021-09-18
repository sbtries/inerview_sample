require 'csv'

data = []

# create list of lists
CSV.foreach('meetups.csv') do |row|
    data << row
end

# headers = nil
# CSV.foreach(('meetups.csv'), headers: true, col_sep: ",") do |row|
#     puts row[0]
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
    

print data