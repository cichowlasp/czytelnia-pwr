json.extract! book, :id, :title, :author, :publisher, :available, :order_id, :library_id, :created_at, :updated_at
json.url book_url(book, format: :json)
