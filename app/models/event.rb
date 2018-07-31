class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged

  include ImageUploader[:image]

  geocoded_by :address, :latitude => :latitude, :longitude => :longitude
  after_validation :geocode

  belongs_to :city

  has_many :rsvps, dependent: :destroy
  has_many :users, through: :rsvps

  before_save :generated_slug
  before_save :pick_date

  private

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
