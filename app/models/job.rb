class Job < ActiveRecord::Base
  belongs_to :language
  has_many :user_jobs
  has_many :users, through: :user_jobs
end
