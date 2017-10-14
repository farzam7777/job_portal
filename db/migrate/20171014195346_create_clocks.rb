class CreateClocks < ActiveRecord::Migration[5.1]
  def change
    create_table :clocks do |t|
      t.time :clock_in
      t.time :clock_out
      t.string :job_id

      t.timestamps
    end
  end
end
