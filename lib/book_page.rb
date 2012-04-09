require "mustache"

class BookPage < Mustache
  self.path = File.join(File.dirname(__FILE__), "..", "templates")

  attr_reader :book

  def initialize(book)
    @book = book
  end # initialize(attributes)

  def file_name
    book.title.gsub(/\s+/, "-").gsub(/[,\.\/\\]/, "") + ".html"
  end # file_name

  def clippings
    book.clippings
  end # clippings
end
