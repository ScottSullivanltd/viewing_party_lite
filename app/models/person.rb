class Person < ApplicationRecord
  has_many :party_people
  has_many :parties, through: :party_people

  validates_presence_of :name
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_digest, require: true
  has_secure_password

  enum role: %w[default manager admin]
end
