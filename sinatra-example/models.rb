require 'mongoid'

# DB Setup
Mongoid.load! "mongoid.config"

class Link
  include Mongoid::Document
  
  field :url, type: String
  field :keyword, type: String
  field :created_on, type: DateTime
  field :hits, type: Integer, :default => 0

  validates :url, presence: true
  validates :keyword, presence: true
  validates :url, length: { minimum: 10, maximum: 200 }
  validates :keyword, uniqueness: true
  
  index({ keyword: 'text' })
  
  # property :id, Serial
  # property :url, String, :length => 200, :required => true,
  #   :messages => {
  #     :presence => 'A URL is required'
  #   }
  # property :keyword, String, :unique => true, :required => true,
  #   :messages => {
  #     :presence => 'A keyword is required',
  #     :is_unique => 'A URL with that keyword already exists'
  #   }
  # property :created_on, Date
  # property :hits, Integer, :default => 0
end

