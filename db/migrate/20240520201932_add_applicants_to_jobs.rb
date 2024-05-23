class AddApplicantsToJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :applicants, :text, array: true, default: []
    add_column :jobs, :applicants_rejected, :text, array: true, default: []
  end
end
