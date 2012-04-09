require "rubygems"
require "bundler/setup"

require File.join(File.dirname(__FILE__), "..", "lib", "clippings_data")

class ListBooksScript
  def initialize(arguments)
    @arguments = arguments
  end # initialize(arguments)

  def run
    if have_path_to_clippings_file?
      clippings_data.books.each do |b|
        puts "#{b.title} by #{b.authors}"
      end
    else
      usage
    end
  end # main

  def usage
    puts "Run script with the path to kindle clippings"
  end # usage

  protected
  def path_to_clippings_file
    @arguments[0]
  end # path_to_clippings_file

  def have_path_to_clippings_file?
    !path_to_clippings_file.nil?
  end # have_path_to_clippings_file?

  def clippings_data
    @clippings_data || ClippingsData.new(path_to_clippings_file)
  end # clippings_data
end

ListBooksScript.new(ARGV).run
