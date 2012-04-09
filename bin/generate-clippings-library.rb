$KCODE = 'UTF8'

require "rubygems"
require "bundler/setup"

require File.join(File.dirname(__FILE__), "..", "lib", "clippings_data")
require File.join(File.dirname(__FILE__), "..", "lib", "book_page")

class GenerateClippingsLibraryScript
  def initialize(arguments)
    @arguments = arguments
  end # initialize(arguments)

  def run
    if have_path_to_clippings_file? and have_path_to_output_directory?
      clippings_data.books.each do |b|
        print_book_to_file(b)
      end
    else
      usage
    end
  end # main

  def usage
    puts "Run script with the path to output dir and clipping file"
  end # usage

  protected
  def path_to_clippings_file
    @arguments[0]
  end # path_to_clippings_file

  def path_to_output_directory
    @arguments[1]
  end # path_to_output_directory

  def have_path_to_clippings_file?
    !path_to_clippings_file.nil?
  end # have_path_to_clippings_file?

  def have_path_to_output_directory?
    !path_to_output_directory.nil?
  end # have_path_to_output_directory?

  def print_book_to_file(book)
    page = BookPage.new(book)
    file_for(page) do |f|
      f << page.render
    end
  end # print_book_to_file(book)

  def file_for(page, &block)
    File.open(File.join(path_to_output_directory, page.file_name), "w") do |f|
      block.call(f)
    end
  end # file_for(book, &block)

  def clippings_data
    @clippings_data || ClippingsData.new(path_to_clippings_file)
  end # clippings_data
end

GenerateClippingsLibraryScript.new(ARGV).run
