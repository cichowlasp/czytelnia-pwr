class Address < ApplicationRecord
  belongs_to :user, :library
end
