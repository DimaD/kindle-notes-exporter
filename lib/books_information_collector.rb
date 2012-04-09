# -*- coding: utf-8 -*-
require File.join(File.dirname(__FILE__), "book")
require File.join(File.dirname(__FILE__), "book_clipping")

class BooksInformationCollector
  def initialize(clippings)
    @clippings = clippings
  end # initialize(clippings)

  def run
    extracted_books_information.keys.map do |book_key|
      Book.new(book_key.merge(:clippings => combined_book_clippings(book_key)))
    end
  end # run

  protected

  def extracted_books_information
    @extracted_books_information ||= @clippings.inject({}) do |memo, c|
      key = { :title => c.book_title, :author => c.author }
      memo[key] ||= []
      memo[key] << c
      memo
    end
  end # extracted_books_information

  def combined_book_clippings(book_key)
    clippings = []

    extracted_books_information[book_key].each do |clip|
      # type can look like :"Highlight on Page 878 |"
      case clip.type.to_s.split(/ /).first.to_sym
      when :Highlight
        clippings << BookClipping.new(clip.content)
      when :Note
        if clip.content.strip.length > 0
          if clippings.size > 0
            clippings.last.add_note(clip.content)
          else
            clippings << BookClipping.new("", [clip.content])
          end
        end
      end
    end

    clippings
  end # combined_book_clippings
end # class BooksInformationCollector
