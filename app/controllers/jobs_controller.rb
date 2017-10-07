class JobsController < ApplicationController
  def index
    @jobs = Job.all.page(params[:page]).per(5)
  end

  def show
  end
end
