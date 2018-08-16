class City < ApplicationRecord
  extend FriendlyId
  friendly_id :uniqueslug, use: :slugged

  geocoded_by :geocoding, :latitude => :latitude, :longitude => :longitude
  after_validation :geocode

  validates :title, presence: true, length: { maximum: 255 }
  validates :image, presence: true
  validates :city, presence: true, length: { maximum: 50 }
  validates :state, presence: true, length: { maximum: 50 }
  validates :country, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 65536 }


  default_scope -> { order('title') }

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
