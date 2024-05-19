# frozen_string_literal: true

AdminUser.create!(email: 'admin@example.com', password: 'password') if Rails.env.development?
EmployerUser.create!(email: 'employer@example.com', password: 'password') if Rails.env.development?
EmployeeUser.create!(email: 'employee@example.com', password: 'password') if Rails.env.development?

Setting.create_or_find_by!(key: 'min_version', value: '0.0')
