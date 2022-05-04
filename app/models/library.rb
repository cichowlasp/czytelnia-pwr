class Library < ApplicationRecord
    has_many :users, :join_table => :library_users
end
