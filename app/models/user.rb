class User < ApplicationRecord
  has_many :user_languages
  has_many :languages, through: :user_languages
  has_many :user_jobs
  has_many :jobs, through: :user_jobs

  has_secure_password

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

end
