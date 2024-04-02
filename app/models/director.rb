class Director < ApplicationRecord
  has_many :movies
  belongs_to :genre
end
