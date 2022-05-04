class Book < ApplicationRecord
  belongs_to :order
  belongs_to :library
end
