class GroupsController < ApplicationController
	before_action :authenticate_user!

	def index
		@groups = current_user.groups.where(active: true)
		@reports = current_user.reports
	end

	def new
		@group = Group.new
		@users = User.all-[current_user]
	end

	def create
		@group = Group.new(group_params)
		@group.users << current_user

		if @group.save
		    redirect_to groups_path
		  else
		    render 'new'
		  end
	end

	def show
		@group = Group.find(params[:id])
		@assignments = @group.assignments.where(active: true)
		@users = @group.users
	end

	def edit
  	@group = Group.find(params[:id])
		@users = User.all-[current_user]
	end

	def update
  	@group = Group.find(params[:id])

	  if @group.update(group_params)
			@group.users << current_user unless @group.users.include? current_user
	    redirect_to groups_path
	  else
	    render 'edit'
	  end
	end

	def destroy
		@group = Group.find(params[:id])
		@group.active = false
		@group.save

    redirect_to groups_path
	end

	private
  def group_params
    params.require(:group).permit(:name, :schedule, :user_ids => [])
  end
end
