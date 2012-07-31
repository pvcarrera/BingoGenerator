require 'prawn'
require './pdf_printer'
require './page'
require 'prawn/measurement_extensions'

describe PdfPrinter do

  context 'default document values' do
    it {subject.bounds.width.should == 450.mm}

    it {subject.bounds.height.should == 320.mm}

    it 'has a grid of 4X6 cells' do
      subject.grid.columns.should == 4
      subject.grid.rows.should == 6
    end

    it {subject.page_count.should == 1}
  end
  
  context 'pages' do
    it 'can add pages' do
      subject.add_page(Page.new)
      subject.page_count.should == 2;
    end
    it 'mantain the grid structure for all pages' do 
      subject.add_page(Page.new)
      subject.go_to_page 2
      subject.grid.columns.should == 4
      subject.grid.rows.should == 6
    end
  end

  context 'after save' do
    xit 'has created a file' do
      
    end
  end
end
