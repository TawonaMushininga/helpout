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

    validate :user_has_already_applied? 
    validate :job_already_taken?
    validate :job_has_max_applicants?

    enum status: { pending: 0, accepted: 1, rejected: 2 }
    enum decline_reason: { 
        not_interested: 0, 
        too_far: 1, 
        too_low: 2, 
        not_enough_experience: 3, 
        not_enough_hours: 4 
    }


    private 

    def job_already_taken?
        unless self.job.employee_id.nil?
            errors.add(:base, "Job has already been accepted by another user")
        end
    end

    def user_has_already_applied?
        if JobApplication.where(user_id: self.user_id, job_id: self.job_id).exists?
            errors.add(:base, "You have already applied for this job")
        end
    end

    def job_has_max_applicants?
        if self.job.job_applications.length >= self.job.max_applicants
            errors.add(:base, "Job has reached maximum applicants")
        end
    end
    
end
