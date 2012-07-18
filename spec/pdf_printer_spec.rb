require 'prawn'
require './pdf_printer'
require 'prawn/measurement_extensions'

describe 'pdf printer' do

  before(:each) do
    @pdf = PdfPrinter.new
  end

  context 'default values' do
    it 'has 450 mm width' do
      @pdf.bounds.width.should == 450.mm
    end
    it 'has 320 mm height' do
      @pdf.bounds.height.should == 320.mm
    end
  end
end
