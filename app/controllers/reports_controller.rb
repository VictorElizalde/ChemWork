class ReportsController < ApplicationController
	before_action :authenticate_user!

	def new
		@group = Group.find(params[:group_id])
		@assignment = @group.assignments.find(params[:assignment_id])
		@report = Report.new
	end

	def create
		@group = Group.find(params[:group_id])
		@assignment = @group.assignments.find(params[:assignment_id])
		@report = @assignment.reports.create(report_params)
		@report.user_id = current_user.id

		if @report.save
				redirect_to group_assignment_path(@group, @assignment)
		  else
		    render 'new'
		  end

	end

	def show
		@report = Report.find(params[:id])
	end

	def download
		@report = Report.find(params[:report_id])
	  send_data(@report.file_contents,
	            type: @report.content_type,
	            filename: @report.filename)
	end

	def destroy
		@assignment = Assignment.find(params[:assignment_id])
		@report = Report.find(params[:id])
		@report.destroy

		redirect_to group_assignment_path(@assignment.group, @assignment)
	end

	private
  def report_params
    params.require(:report).permit(:lab_phase, :file, :user_id, :assignment_id, :shared_with)
  end
end
