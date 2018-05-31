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

  def self.is_nil?(item)
    if item == nil || item == {} || item == [] || item == ""
      item = "Not Available"
    else
      item
    end
  end

  def self.pg_count(language)
    url = "https://api.adzuna.com:443/v1/api/jobs/us/search/1?app_id=189edd09&app_key=1feefbefc8cdd067528cf11b48d913fd&what=#{language}&what_and=developer&where=10010&distance=25&max_days_old=120&full_time=1"

    data = make_request(url)
    data["count"]
  end

  def self.mean(language)
    url = "https://api.adzuna.com:443/v1/api/jobs/us/search/1?app_id=189edd09&app_key=1feefbefc8cdd067528cf11b48d913fd&what=#{language}&what_and=developer&where=10010&distance=25&max_days_old=120&full_time=1"

    data = make_request(url)
    data["mean"]
  end

  def self.job_search(pg_num = 1, language)
    url = "https://api.adzuna.com:443/v1/api/jobs/us/search/#{pg_num}?app_id=189edd09&app_key=1feefbefc8cdd067528cf11b48d913fd&what=#{language}&what_and=developer&where=10010&distance=25&max_days_old=120&full_time=1"

    data = make_request(url)

    listing_array = []

    data["results"].each do |listing|

      listing_hash = {company_name: "", title: "", description: ""}

      listing_hash[:company_name] = is_nil?(listing["company"]["display_name"]).gsub("<strong>", "").gsub("</strong>", "")

      listing_hash[:title] = is_nil?(listing["title"]).gsub("<strong>", "").gsub("</strong>", "")

      listing_hash[:description] = is_nil?(listing["description"]).gsub("<strong>", "").gsub("</strong>", "")

      listing_hash[:redirect_url] = is_nil?(listing["redirect_url"])

      listing_hash[:id] = is_nil?(listing["id"])

      listing_array << listing_hash
    end
  listing_array
  end
end
