class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs do |t|
      t.integer :employer_id
      t.integer :employee_id
      t.string :title
      t.text :description
      t.string :location
      t.integer :job_type
      t.float :amount
      t.integer :payment_type
      t.integer :region
      t.datetime :deadline
      t.integer :experience
      t.integer :hours

      t.timestamps
    end
  end
end
