require './card'

class Page
  MAX_CARDS = 15
  attr_reader :width
  attr_reader :height
  attr_reader :cards

  def initialize
    @width = '1361px'
    @height = '938px'
    @cards = Array.new

    (1..MAX_CARDS).each{ @cards << Card.new }
  end
end
