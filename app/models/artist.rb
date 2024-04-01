class Artist < ApplicationRecord
  has_many :albums
  has_many :tracks, through: :albums
end
