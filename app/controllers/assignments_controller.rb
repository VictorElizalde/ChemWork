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
		@assignment = Assignment.find(params[:id])
	end

	def edit
  	@assignment = Assignment.find(params[:id])
	end

	def update
  	@assignment = Assignment.find(params[:id])

	  if @assignment.update(assignment_params)
	    redirect_to groups_path
	  else
	    render 'edit'
	  end
	end

	private
  def assignment_params
    params.require(:assignment).permit(:name, :group_id)
  end
end
