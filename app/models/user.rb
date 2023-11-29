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

  has_many :articles, dependent: :destroy
end
