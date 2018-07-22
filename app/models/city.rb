class City < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :events

  before_save :should_generate_new_friendly_id?, if: :title_changed?
  
  private

    def should_generate_new_friendly_id?
      title_changed?
    end

end
