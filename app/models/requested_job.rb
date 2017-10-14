class RequestedJob < ApplicationRecord
  belongs_to :user
  belongs_to :job

  scope :admin_report_request_pending_jobs, ->{ where(status: 'Not Reviewed') }
end
