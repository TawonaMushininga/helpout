class CreateJobApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :job_applications do |t|
      t.integer :user_id
      t.integer :job_id
      t.integer :status, default: 0
      t.integer :decline_reason

      t.string :value
      t.timestamps
    end
  end
end
