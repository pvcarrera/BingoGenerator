require 'prawn'
require './card'
require './page'
require 'prawn/measurement_extensions'

class PdfPrinter < Prawn::Document
  def initialize
    super(
      :page_size => [450.mm, 320.mm],
      :margin => 0,
      :page_layout => :portrait
      )
    define_grid(:columns => 4, :rows => 6)
  end

  def save_as(file)
    (0..3).each do |row| 
      (0..5).each do |col|
        grid(col, row).bounding_box do
          draw_table
        end
      end
    end
    render_file(file)
  end

  def add_page(page)
    start_new_page
  end 

  private

  def draw_table
    c = Card.new
    table = make_table (c.to_a)
    table.draw
  end
end
