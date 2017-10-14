class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :job_type
      t.string :day
      t.string :location
      t.string :payment
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.string :status

      t.timestamps
    end
  end
end
