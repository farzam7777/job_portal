class JobsController < ApplicationController
  def index
    authorize! :index, Job
    @jobs = Job.tagged_with_jobs(current_user).page(params[:page]).per(5)
  end

  def show
    authorize! :show, @job
    @job = Job.find(params[:id])
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

  def clock_in
    session[:clock_in] = Time.now
    session[:job_id] = params[:id]
    redirect_to page_path('my_jobs'), notice: 'Clocked In successfully'
  end

  def clock_out
    if session[:clock_in].present?
      clock_in = session[:clock_in]
      job_id = session[:job_id]
      session[:clock_in] = nil
      session[:job_id] = nil
      total_time = (TimeDifference.between(Time.now, clock_in).in_minutes) / 60
      redirect_to page_path('my_jobs'), notice: total_time.to_s
    else
      redirect_to page_path('my_jobs'), alert: 'You muse clock in before clocking out'
    end
  end
end
