class Track < ApplicationRecord
  belongs_to :album
  belongs_to :media_type
  belongs_to :genre
  has_and_belongs_to_many :playlists
  has_many :artists, through: :album
end
