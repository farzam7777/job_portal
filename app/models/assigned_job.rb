class AssignedJob < ApplicationRecord
	belongs_to :user
	belongs_to :job

  has_attached_file :pay_slip
  validates_attachment_content_type :pay_slip, content_type: 'text/plain'
end
