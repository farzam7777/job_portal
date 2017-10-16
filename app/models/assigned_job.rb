class AssignedJob < ApplicationRecord
	belongs_to :user
	belongs_to :job

  after_destroy { |record| RequestedJob.where(job_id: record.job.id, user_id: record.user_id).delete_all }

	scope :admin_report_payment_pending, ->{ where(payment_status: 'Pending') }
	scope :admin_report_payment_complete, ->{ where(payment_status: 'Complete') }

  has_attached_file :pay_slip
  validates_attachment_content_type :pay_slip, content_type: ["application/pdf","application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
             "text/plain"]
end
