class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :publications, foreign_key: 'creator_id', dependent: :destroy # destroy all the publications associated to the user (as a creator) if it gets destroyed
  has_many :skills, foreign_key: 'musician_id', dependent: :destroy # destroy all the skills associated to the user if it gets destroyed

  has_many :attendances, foreign_key: 'attendee_id', dependent: :destroy # destroy all the attendances associated to the user if it gets destroyed
  has_many :events, foreign_key: 'creator_id', dependent: :destroy # destroy all the events associated to the user (as a creator) if it gets destroyed

  has_many :attended_events, through: :attendances, source: :event # optional: allows to access events that a user has attended without directly querying the attendances table.

  PASSWORD_FORMAT = /\A
    (?=.{8,})          # Must contain 8 or more characters
    (?=.*\d)           # Must contain a digit
    (?=.*[a-z])        # Must contain a lower case character
    (?=.*[A-Z])        # Must contain an upper case character
    (?=.*[[:^alnum:]]) # Must contain a symbol
  /x
  
  validates :email, presence: true, uniqueness: true, format: {
    with: URI::MailTo::EMAIL_REGEXP,
  }
  validates :password, presence: true, format: {
    with: PASSWORD_FORMAT,
    }
end
