require_relative './art_viewer/version'
require_relative './art_viewer/cli'
require_relative './art_viewer/scraper'
require_relative './art_viewer/category'
require_relative './art_viewer/art'

require 'rubygems'
require 'pry'
require 'nokogiri'
require 'open-uri'
require 'htmlentities'

module ArtViewer
  @@extension = "/"
  @@layer = 1

  def self.extension
    return @@extension
  end

  def self.extension=(ext)
    @@extension = ext
  end

  def self.layer
    return @@layer
  end

  def self.layer=(num)
    @@layer = num
  end
  
  def self.incrementLayer
    return @@layer += 1
  end

  class Error < StandardError; end
  # Your code goes here...
end
