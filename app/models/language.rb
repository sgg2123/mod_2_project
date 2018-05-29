class Language < ApplicationRecord
  has_many :user_languages
  has_many :users, through: :user_languages
  has_many :company_languages
  has_many :companies, through: :company_languages
end
