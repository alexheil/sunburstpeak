class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :confirmable
  #:omniauthable, :lockable

  attr_accessor :login

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z0-9]+\Z/i }
  validate :validate_username

  has_many :events, dependent: :destroy
  has_many :rsvps, dependent: :destroy

  before_save :should_generate_new_friendly_id?, if: :username_changed?
  before_save :downcase_username

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def self.rsvp_mailer
    User.includes(:rsvps).where( :rsvps => 'Date.today' ).find_each do |user|
      UserMailer.rsvp_email(user).deliver_now 
    end
  end

  def rsvped?(event)
    Rsvp.exists? user_id: id, event_id: event.id
  end

  def unrsvp(event)
    Rsvp.find_by(user_id: id, event_id: event.id).destroy
  end

  def rsvp_id(event)
    Rsvp.find_by(user_id: id, event_id: event.id).id
  end

  def liked?(thing)
    Like.exists? user_id: id, thing_id: thing.id
  end

  def unlike(thing)
    Like.find_by(user_id: id, thing_id: thing.id).destroy
  end

  def like_id(thing)
    Like.find_by(user_id: id, thing_id: thing.id).id
  end

  private

    def should_generate_new_friendly_id?
      username_changed?
    end

    def downcase_username
      self.username = username.downcase
    end

end
