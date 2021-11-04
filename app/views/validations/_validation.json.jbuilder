json.extract! validation, :id, :type, :url, :webpage_id, :warnings, :errors, :created_at, :updated_at
json.url validation_url(validation, format: :json)
