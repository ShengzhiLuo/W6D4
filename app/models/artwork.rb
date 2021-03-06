class Artwork < ApplicationRecord
    validates :title, :image_url, :artist_id, presence: true
    validates :artist_id, uniqueness: { scope: :title}

    belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User

    has_many :shared_artworks,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

    has_many :shared_viewers,
    through: :shared_artworks,
    source: :viewer

    has_many :comment,
    foreign_key: :artwork_id,
    class_name: :Comment,
    dependent: :destroy
end