class Book < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :library
end
