# == Schema Information
#
# Table name: job_applications
#
#  id             :bigint           not null, primary key
#  user_id        :integer
#  job_id         :integer
#  status         :integer          default("pending")
#  decline_reason :integer
#  value          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class JobApplication < ApplicationRecord
    belongs_to :user
    belongs_to :job
    enum status: { pending: 0, accepted: 1, rejected: 2 }
    enum decline_reason: { 
        not_interested: 0, 
        too_far: 1, 
        too_low: 2, 
        not_enough_experience: 3, 
        not_enough_hours: 4 
    }
end
