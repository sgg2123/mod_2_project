require 'pry'
require 'rest-client'
require 'json'

class Job < ActiveRecord::Base
  belongs_to :language
  has_many :user_jobs
  has_many :users, through: :user_jobs

  def self.make_request(url)
    all_characters = RestClient.get(url)
    JSON.parse(all_characters)
  end


  #######
  def self.job_search(pg_num = 1, language)
    url = "https://api.adzuna.com:443/v1/api/jobs/us/search/#{pg_num}?app_id=189edd09&app_key=1feefbefc8cdd067528cf11b48d913fd&what=#{language}&what_and=developer&where=10010&distance=25&max_days_old=120&full_time=1"

    data = make_request(url)

    listing_array = []

    data["results"].each do |listing|
      listing_hash = {company_name: "", title: "", description: ""}
      listing_hash[:company_name] = listing["company"]["display_name"].gsub("<strong>", "").gsub("</strong>", "")
      listing_hash[:title] = listing["title"].gsub("<strong>", "").gsub("</strong>", "")
      listing_hash[:description] = listing["description"].gsub("<strong>", "").gsub("</strong>", "")
      listing_hash[:redirect_url] = listing["redirect_url"]
      listing_hash[:id] = listing["id"]
      listing_array << listing_hash
    end
  listing_array
  end
  # until pg_num >= data["count"]/10.0 + 1
  #   pg_num += 1
  # end

end
