class AssignmentsController < ApplicationController
	before_action :authenticate_user!

	def new
		@group = Group.find(params[:group_id])
		@assignment = Assignment.new
	end

	def create
		@group = Group.find(params[:group_id])
    @assignment = @group.assignments.create(assignment_params)

		if @assignment.save
				redirect_to group_path(@group)
		  else
		    render 'new'
		  end
	end

	def show
		@group = Group.find(params[:group_id])
		@assignment = Assignment.find(params[:id])
	end

	def edit
		@group = Group.find(params[:group_id])
  	@assignment = @group.assignments.find(params[:id])
	end

	def update
		@group = Group.find(params[:group_id])
  	@assignment = @group.assignments.find(params[:id])

	  if @assignment.update(assignment_params)
	    redirect_to group_path(@group)
	  else
	    render 'edit'
	  end
	end

	def destroy
		@group = Group.find(params[:group_id])
		@assignment = @group.assignments.find(params[:id])
		@assignment.active = false
		@assignment.save

    redirect_to group_path(@group)
	end

	private
  def assignment_params
    params.require(:assignment).permit(:name, :group_id)
  end
end
