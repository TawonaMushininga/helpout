class AddStatusToJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :status, :integer
  end
end
