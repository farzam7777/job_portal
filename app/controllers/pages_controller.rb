class PagesController < ApplicationController
  def my_jobs
  	@jobs = current_user.AssignedJobs
  end
end
