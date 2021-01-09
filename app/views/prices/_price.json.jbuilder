# frozen_string_literal: true

json.extract! price, :id, :float, :sample_id, :created_at, :updated_at
json.url price_url(price, format: :json)
