require 'prawn'
require './card'
require 'prawn/measurement_extensions'

class PdfPrinter < Prawn::Document
  def initialize
    super(:page_size => [450.mm, 320.mm], :page_layout => :portrait)
  end

  def save_as(file)
    define_grid(:columns => 4, :rows => 6)
    (0..3).each do |row| 
      (0..5).each do |col|
        grid(col, row).bounding_box do
          draw_table
        end
      end
    end
    render_file(file)
  end

  private

  def draw_table
    c = Card.new
    table = make_table (c.card)
    table.draw
  end
end
