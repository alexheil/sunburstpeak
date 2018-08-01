class City < ApplicationRecord
  extend FriendlyId
  friendly_id :uniqueslug, use: :slugged

  geocoded_by :geocoding, :latitude => :latitude, :longitude => :longitude
  after_validation :geocode

  has_many :events, dependent: :destroy
  has_many :things, dependent: :destroy

  before_save :should_generate_new_friendly_id?, if: :title_changed?
  before_save :title_calculator
  before_save :set_slug

  private

    def should_generate_new_friendly_id?
      title_changed?
    end

    def title_calculator
      if self.state.present?
        self.title = self.city + ", " + self.state + ", " + self.country
      elsif self.state.blank?
        self.title = self.city + ", " + self.country
      end
    end

    def geocoding
      if self.state.present?
        [city, state, country].compact.join(', ')
      elsif self.state.blank?
        [city, country].compact.join(', ')
      end
    end

    def uniqueslug
      if self.state.present?
        "#{city}-#{state}-#{country}" 
      elsif self.state.blank?
        "#{city}-#{country}" 
      end
    end

end
