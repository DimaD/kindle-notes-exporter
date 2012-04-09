require "kindleclippings"

require File.join(File.dirname(__FILE__), "books_information_collector")

class ClippingsData
  #
  # API
  #

  def initialize(path_to_clippings_file)
    @path_to_clippings_file = path_to_clippings_file
  end

  def books
    @books ||= BooksInformationCollector.new(clippings).run
  end # books

  protected

  def parser
    @parser ||= KindleClippings::Parser.new
  end # parser

  def clippings
    @clippings ||= parser.parse_file(@path_to_clippings_file)
  end # clippings
end # ClippingsData
