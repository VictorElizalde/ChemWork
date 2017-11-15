class ReportsController < ApplicationController
	before_action :authenticate_user!

	def new
		@group = Group.find(params[:group_id])
		@assignment = @group.assignments.find(params[:assignment_id])
		@report = Report.new
	end

	def create


	end

	def show
	  send_data(@document.file_contents,
	            type: @document.content_type,
	            filename: @document.filename)
	end

	private
  def report_params
    params.require(:report).permit(:lab_phase, :file, :user_id, :assignment_id, :shared_with)
  end
end
