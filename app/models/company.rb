class Company < ActiveRecord::Base
  has_many :company_languages
  has_many :languages, through: :company_languages
  has_many :user_companies
  has_many :users, through: :user_companies
end
