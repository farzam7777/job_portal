class AddAttachmentPaySlipToAssignedJobs < ActiveRecord::Migration[5.1]
  def self.up
    change_table :assigned_jobs do |t|
      t.attachment :pay_slip
    end
  end

  def self.down
    remove_attachment :assigned_jobs, :pay_slip
  end
end
