class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true, length: { maximum: 255 }
  validates :image, presence: true
  validates :description, presence: true, length: { maximum: 65536 }
  
  before_save :should_generate_new_friendly_id?, if: :title_changed?
  
  private

    def should_generate_new_friendly_id?
      title_changed?
    end

end
