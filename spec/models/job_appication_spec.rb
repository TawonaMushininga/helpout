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
require 'rails_helper'

RSpec.describe JobAppication, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
