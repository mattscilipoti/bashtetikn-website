json.extract! page_scan, :id, :type, :url, :webpage_id, :warnings, :issues, :created_at, :updated_at
json.url page_scan_url(page_scan, format: :json)
