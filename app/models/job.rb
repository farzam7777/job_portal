class Job < ApplicationRecord
  acts_as_taggable
  
  has_many :RequestedJobs
  has_many :AssignedJobs
end
