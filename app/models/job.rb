class Job < ApplicationRecord
  acts_as_taggable
  
  has_many :RequestedJobs
  has_one :AssignedJob
end
