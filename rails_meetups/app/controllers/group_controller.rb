# I think this controller is not needed anymore, from prev attempt

# class GroupController < ApplicationController
#     def index
#         @show = Group.all
#       end
#       def new
#         @group = Group.new
#       end
#       def show
#         @group = Group.find(params[:id])
#         @events = @group.events
#         @posts = @group.posts.recent.paginate(:page => params[:page], :per_page => 5)
#       end
#     #   def edit
#     #   end
#       def create
#         @group = Group.new(group_params)
#         @group.user = current_user
#         if @group.save
#           current_user.join!(@group)
#           current_user.own!(@group)
#           redirect_to groups_path
#         else
#           render :new
#         end
#       end
#       def update
#         if @group.update(group_params)
#         redirect_to groups_path, notice: "Update Success"
#         else
#           render :edit
#         end
#       end
#       def destroy
#         @group.destroy
#         redirect_to groups_path, alert: "Group Deleted"
#       end
# end
