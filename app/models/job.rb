class Job < ApplicationRecord
  acts_as_taggable
  
  has_many :RequestedJobs
  has_one  :AssignedJob
	has_many :clocks 
	 
  scope :admin_report_jobs_expired, ->{ where("end_date < ?", Date.today) }
  scope :tagged_with_jobs, ->(user = nil) { includes(:AssignedJob, :RequestedJobs).tagged_with(user.tag_list, wild: true, any: true)
            .all }
end
