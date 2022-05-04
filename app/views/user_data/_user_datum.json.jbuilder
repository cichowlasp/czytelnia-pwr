json.extract! user_datum, :id, :name, :surname, :university, :department, :field_of_study, :country, :user_id, :created_at, :updated_at
json.url user_datum_url(user_datum, format: :json)
