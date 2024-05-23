class AddMaxApplicantsToJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :max_applicants, :integer
  end
end
