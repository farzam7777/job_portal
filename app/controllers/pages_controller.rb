class PagesController < ApplicationController
  def my_jobs
  	@jobs = current_user.AssignedJobs.includes(job: :clocks)
  end
end
