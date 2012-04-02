require './page'


describe 'bingo page' do
  before(:each) do
    @page = Page.new
  end

  it 'width is 1361px' do
    @page.width.should eql '1361px'
  end

  it 'heigth is 938px' do
    @page.height.should eql '938px'
  end

  it 'has 15 cards' do
    @page.cards.size.should eql 15
  end
end
