class Room < ApplicationRecord
  has_many :customers
  has_many :bookings
end
