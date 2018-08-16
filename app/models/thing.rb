class Thing < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  enum thing_type: [:free, :paid]

  scope :popular, -> {select("things.id, things.slug, things.image, things.title, things.thing_type, things.description, things.venue, count(likes.id) likes_count").joins(:likes).group("things.id").reorder("likes_count desc")}

  geocoded_by :address, :latitude => :latitude, :longitude => :longitude
  after_validation :geocode

  validates :title, presence: true, length: { maximum: 255 }
  validates :image, presence: true
  validates :venue, presence: true, length: { maximum: 255 }
  validates :address, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 65536 }
  validates :what_to_bring, presence: true, length: { maximum: 65536 }
  validates :what_to_wear, presence: true, length: { maximum: 65536 }
  validates :where_to_park, presence: true, length: { maximum: 65536 }

  belongs_to :city

  has_many :likes, dependent: :destroy

  before_save :should_generate_new_friendly_id?, if: :title_changed?

  private

    def should_generate_new_friendly_id?
      title_changed?
    end

end
