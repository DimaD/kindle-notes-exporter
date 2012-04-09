class Book
  attr_reader :attributes

  def initialize(attributes)
    @attributes = attributes
  end # initialize(attributes)

  def author
    @author ||= attributes[:author]
  end # author

  def authors
    author
  end # authors

  def title
    @title ||= attributes[:title].strip
  end # title

  def clippings
    @clippings ||= attributes[:clippings]
  end # clippings
end
