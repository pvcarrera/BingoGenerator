require 'prawn'
require './pdf_printer'
require './page'
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
  
  context 'before save' do
    it 'can add pages' do
      @pdf.add_page(Page.new)
      @pdf.page_count.should == 2;
    end
  end

  context 'after save' do
    it 'has created a file' do
      
    end
  end
end
