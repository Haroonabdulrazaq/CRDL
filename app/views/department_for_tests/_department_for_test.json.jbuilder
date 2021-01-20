# frozen_string_literal: true

json.extract! department_for_test, :id, :title, :description, :user_id, :created_at, :updated_at
json.url department_for_test_url(department_for_test, format: :json)
