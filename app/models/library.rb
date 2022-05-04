class Library < ApplicationRecord
    has_many :users, :join_table => :library_users
    has_many :books
end
