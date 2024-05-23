# == Schema Information
#
# Table name: job_appications
#
#  id             :bigint           not null, primary key
#  user_id        :integer
#  job_id         :integer
#  status         :integer          default(0)
#  decline_reason :integer
#  value          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
FactoryBot.define do
  factory :job_appication do
    
  end
end
