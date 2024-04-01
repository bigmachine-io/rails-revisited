class Track < ApplicationRecord
  belongs_to :album
  belongs_to :media_type
  belongs_to :genre
end
