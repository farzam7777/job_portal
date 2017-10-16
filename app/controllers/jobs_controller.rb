class JobsController < ApplicationController
  def index
    if user_signed_in?
      @jobs = Job.tagged_with_jobs(current_user).page(params[:page]).per(5)
    end
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

  def clock_in
    if !session[:clock_in].present?
      session[:clock_in] = Time.now
      session[:job_id] = AssignedJob.find(params[:id]).job.id
      redirect_to page_path('my_jobs'), notice: 'Clocked In successfully'
    else
      redirect_to page_path('my_jobs'), alert: 'Already Clocked In'
    end
  end

  def clock_out
    if session[:clock_in].present?
      clock_in = session[:clock_in]
      job_id = session[:job_id]
      session[:clock_in] = nil
      session[:job_id] = nil
      #total_time = (TimeDifference.between(Time.now, clock_in).in_minutes) / 60
      @job = Job.find(job_id)
      @job.AssignedJob.payment = params[:net]
      @job.AssignedJob.total_hours = params[:hours]
      @job.AssignedJob.save
      @clock = @job.clocks.build(clock_in: clock_in, clock_out: Time.now)
      if @clock.save
        redirect_to page_path('my_jobs'), notice: 'Clocked Out successfully'
      end
    else
      redirect_to page_path('my_jobs'), alert: 'You muse clock in before clocking out'
    end
  end
end
