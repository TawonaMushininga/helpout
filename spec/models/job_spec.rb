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
require 'rails_helper'

RSpec.describe Job, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
