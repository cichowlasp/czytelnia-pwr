class Library < ApplicationRecord
    has_many :users, :join_table => :library_users
    has_many :books
    has_one :address
    accepts_nested_attributes_for :users
end
