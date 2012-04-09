class BookClipping
  attr_reader :highlight, :notes
  def initialize(highlight, notes=[])
    @highlight = highlight
    @notes     = notes
  end # initialize(clippings)

  def add_note(note)
    @notes << note
  end # add_note
end # class BookClipping
