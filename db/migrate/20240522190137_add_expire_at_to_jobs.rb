class AddExpireAtToJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :expires_at, :timestamp
  end
end
