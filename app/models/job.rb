# == Schema Information
#
# Table name: jobs
#
#  id                  :bigint           not null, primary key
#  employer_id         :integer
#  employee_id         :integer
#  title               :string
#  description         :text
#  location            :string
#  job_type            :integer
#  amount              :float
#  payment_type        :integer
#  region              :integer
#  deadline            :datetime
#  experience          :integer
#  hours               :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  date                :datetime
#  timeslot            :integer
#  status              :integer
#  applicants          :text             default([]), is an Array
#  applicants_rejected :text             default([]), is an Array
#  max_applicants      :integer
#  expires_at          :datetime
#
class Job < ApplicationRecord
    belongs_to :employer, class_name: 'User', foreign_key: 'employer_id'
    belongs_to :employee, class_name: 'User', foreign_key: 'employee_id', optional: true
    has_many :job_applications

    enum job_type: { 
        software: 0, 
        agriculture: 1, 
        tutor: 2, 
        manager: 3, 
        fishing: 4 
    }
    enum payment_type: { hourly: 0, fixed: 1 }
    enum region: { harare: 0, bulawayo: 1, mazowe: 2, marondera: 3, mvurwi: 4 }
    enum timeslot: { 
        "00:00": 0, 
        "01:00": 1, 
        "02:00": 2,
        "03:00": 3,
        "04:00": 4,
        "05:00": 5,
        "06:00": 6,
        "07:00": 7,
        "08:00": 8,
        "09:00": 9,
        "10:00": 10,
        "11:00": 11,
        "12:00": 12,
        "13:00": 13,
        "14:00": 14,
        "15:00": 15,
        "16:00": 16,
        "17:00": 17,
        "18:00": 18,
        "19:00": 19,
        "20:00": 20,
        "21:00": 21,
        "22:00": 22,
        "23:00": 23,
    }

    enum status: { 
        inactive: 0,
        active: 1,
        accepted: 2,
        completed: 3,
        cancelled: 4,
    }

    enum experience: {
        entry: 0,
        beginner: 1,
        intermediate: 2,
        expert: 3
    }

    before_create :set_status

    private 

    def set_status
        self.status = :active
    end
end
