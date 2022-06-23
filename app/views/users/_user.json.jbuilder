json.extract! user, :index ,:id, :admin, :library_id, :created_at, :updated_at
json.url user_url(user, format: :json)
