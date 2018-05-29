class CompanyLanguage < ActiveRecord::Base
  belongs_to :language
  belongs_to :company
end
