class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged

  include ImageUploader[:image]

  enum event_type: [:free, :paid]

  geocoded_by :address, :latitude => :latitude, :longitude => :longitude
  after_validation :geocode

  validates :title, presence: true, length: { maximum: 255 }
  validates :image_data, presence: true, unless: :image_data?
  validates :venue, presence: true, length: { maximum: 255 }
  validates :address, presence: true, length: { maximum: 255 }
  validates :website, format: { with: /\A((http|https)?:\/\/)?(www.)?[a-zA-Z0-9]+.[a-z]+\/?/i }, allow_blank: true
  validates :description, presence: true, length: { maximum: 65536 }
  validates :what_to_bring, presence: true, length: { maximum: 65536 }
  validates :what_to_wear, presence: true, length: { maximum: 65536 }
  validates :where_to_park, presence: true, length: { maximum: 65536 }
  validates :start_hour, presence: true
  validates :end_hour, presence: true
  validates :start_minute, presence: true
  validates :end_minute, presence: true
  validates :start_am_pm, presence: true
  validates :end_am_pm, presence: true
  validates :month, presence: true
  validates :day, presence: true
  validates :year, presence: true
  validates :price, presence: true, if: :is_for_sale

  validate :time_calculator

  belongs_to :user
  belongs_to :city

  has_many :rsvps, dependent: :destroy
  has_many :users, through: :rsvps

  before_save :generated_slug
  before_save :pick_date
  before_save :time_calculator
  #before_save :smart_add_url_protocol

  private

    def smart_add_url_protocol
      unless self.website[/\Ahttp:\/\//] || self.website[/\Ahttps:\/\//]
        self.website = "https://#{self.website}" unless website.blank?
      end
    end

    def time_calculator
      if self.start_am_pm == "am" && self.end_am_pm == "am"
        unless self.start_hour.to_i < self.end_hour.to_i
          errors.add(:end_hour, :invalid)
        end
      elsif self.start_am_pm == "pm" && self.end_am_pm == "pm"
        unless self.start_hour.to_i < self.end_hour.to_i
          errors.add(:end_hour, :invalid)
        end
      elsif self.start_am_pm == "pm"
        unless self.end_am_pm == "pm"
          errors.add(:end_am_pm, :invalid)
        end
      end
    end

    def is_for_sale
      self.paid?
    end

    def generated_slug
      require 'securerandom' 
      self.slug = SecureRandom.hex(16) if slug.blank?
    end

    def pick_date
      if self.start_time.blank?
        if month == "January"
          self.month = "1"
        elsif month == "February"
          self.month = "2"
        elsif month == "March"
          self.month = "3"
        elsif month == "April"
          self.month = "4"
        elsif month == "May"
          self.month = "5"
        elsif month == "June"
          self.month = "6"
        elsif month == "July"
          self.month = "7"
        elsif month == "August"
          self.month = "8"
        elsif month == "September"
          self.month = "9"
        elsif month == "October"
          self.month = "10"
        elsif month == "November"
          self.month = "11"
        elsif month == "December"
          self.month = "12"
        end

        self.start_time = self.year + "-" + self.month + "-" + self.day
      end
    end

end
