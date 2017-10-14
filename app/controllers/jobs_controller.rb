class JobsController < ApplicationController
  def index
    @jobs = Job.includes(:AssignedJobs).all.page(params[:page]).per(5)
    authorize! :index, Job
  end

  def show
    @job = Job.find(params[:id])
    authorize! :show, @job
  end
  
  def request_job
    @user = current_user
    @job = Job.find(params[:id])
    @requested_job =  @user.RequestedJobs.build(job_id: @job.id, status: 'Not Reviewed')
    if @requested_job.save
      redirect_to job_path(@job), :notice => "You have successfully applied for this job. "
    else
      redirect_to job_path(@job), :notice => "Some Problem Occured. "
    end
  end
end
