class Thing < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  geocoded_by :address, :latitude => :latitude, :longitude => :longitude
  after_validation :geocode

  belongs_to :city

  before_save :should_generate_new_friendly_id?, if: :title_changed?

  private

    def should_generate_new_friendly_id?
      title_changed?
    end

end
