# == Schema Information
#
# Table name: jobs
#
#  id           :bigint           not null, primary key
#  employer_id  :integer
#  employee_id  :integer
#  title        :string
#  description  :text
#  location     :string
#  job_type     :integer
#  amount       :float
#  payment_type :integer
#  region       :integer
#  deadline     :datetime
#  experience   :integer
#  hours        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  date         :datetime
#  timeslot     :integer
#  status       :integer
#
FactoryBot.define do
  factory :job do
    
  end
end
