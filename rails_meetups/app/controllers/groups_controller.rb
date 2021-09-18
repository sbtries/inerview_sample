class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]
  before_action :authenticate_account!, except: [:index, :show] #go and hide buttons on view also

  # GET /groups or /groups.json
  def index
    @groups = Group.all
    @users = User.all

  end
  #import data for models 
  def import
  end

  # GET /groups/1 or /groups/1.json
  def show

    @users = []

    # get all members belonging to group
    members = GroupMember.where(group_id: params[:id])
    # for each member get associated user & create hash (dict)
    # the push dict to list for view/template
    members.each do |member|
      db_user = User.where(id: member.user_id).first
      user = {
        role: member.role,
        first_name: db_user.first_name,
        last_name: db_user.last_name
      }
      @users.push(user)
    end
    @members = GroupMember.where(group_id: params[:id])

    puts @users

  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:title)
    end
end
