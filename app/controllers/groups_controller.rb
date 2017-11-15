class GroupsController < ApplicationController
	before_action :authenticate_user!

	def index
	end

	def new
		@group = Group.new
	end

	def create
		@group = Group.new(group_params)

		if @group.save
		    redirect_to @groups
		  else
		    render 'new'
		  end
	end

	private
  def group_params
    params.require(:group).permit(:name, :schedule)
  end
end
