json.extract! webpage, :id, :name, :url, :created_at, :updated_at
json.url webpage_url(webpage, format: :json)
