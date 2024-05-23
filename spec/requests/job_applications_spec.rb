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
require 'rails_helper'

RSpec.describe "JobApplications", type: :request do
  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end
end
