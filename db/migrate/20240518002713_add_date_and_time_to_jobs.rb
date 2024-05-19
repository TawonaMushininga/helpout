class AddDateAndTimeToJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :date, :timestamp
    add_column :jobs, :timeslot, :integer
  end
end
