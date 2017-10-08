class JobsController < ApplicationController
  def index
    @jobs = Job.all.page(params[:page]).per(5)
    authorize! :index, Job
  end

  def show
    @job = Job.find(params[:id])
    authorize! :show, @job
  end
end
