require_relative './art_viewer/version'
require_relative './art_viewer/cli'
require_relative './art_viewer/scraper'
require_relative './art_viewer/category'

require 'pry'
require 'nokogiri'
require 'open-uri'

module ArtViewer
  @@layer = 1
  @@selection = ""

  def self.selection
    @@selection
  end

  def self.setSelection(selection)
    @@selection = selection
  end

  def self.layer
    @@layer
  end

  def self.setLayer(value)
    @@layer = value
  end

  class Error < StandardError; end
  # Your code goes here...
end
