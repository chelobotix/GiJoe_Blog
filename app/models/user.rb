class User < ApplicationRecord
  # private_constant
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  private_constant :VALID_EMAIL_REGEX

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 100 },
            format: { with: VALID_EMAIL_REGEX }
  validates :faction, presence: true

  has_many :articles, dependent: :destroy

  before_save :mail_lowercase

  # mail_lowercase
  def mail_lowercase
    self.email = email.downcase
  end

  # authentication
  has_secure_password
end
