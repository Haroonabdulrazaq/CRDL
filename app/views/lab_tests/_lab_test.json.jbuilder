json.extract! lab_test, :id, :title, :description, :price_per_unit, :user_id, :department_for_test_id, :created_at, :updated_at
json.url lab_test_url(lab_test, format: :json)
