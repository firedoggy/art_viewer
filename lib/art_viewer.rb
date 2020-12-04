require_relative './art_viewer/version'
require_relative './art_viewer/cli'
require_relative './art_viewer/scraper'
require_relative './art_viewer/category'

require 'pry'
require 'nokogiri'
require 'open-uri'

module ArtViewer
  
  def self.incrementLayer
    @@layer += 1
  end

  class Error < StandardError; end
  # Your code goes here...
end
