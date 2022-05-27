class Library < ApplicationRecord
    has_many :users, dependent: :delete_all
    has_many :books
    has_one :address
    accepts_nested_attributes_for :users, allow_destroy: true
end
