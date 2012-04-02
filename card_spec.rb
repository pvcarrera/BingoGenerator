require './card'

describe 'bingo card' do

  before(:each) do
    @card = Card.new
  end
  
  describe 'has 3 rows and 9 columns' do
    it 'has 3 rows' do
      @card.row(1).should_not be_nil 
      @card.row(2).should_not be_nil 
      @card.row(3).should_not be_nil 
      @card.row(4).should be_nil 
    end

    it 'has 9 columns' do
      @card.row(1)[0].should_not be_nil 
      @card.row(1)[8].should_not be_nil 
      @card.row(1)[9].should be_nil 
    end
  end

  it 'has four gaps in each row' do
    @card.row(1).count(0).should eql 4
  end

  it 'has 15 uniq random numbers from 1 to 90' do
    all_numbers = @card.row(1) + @card.row(2) + @card.row(3)
    valid_numbers = all_numbers.select{|element| (1..90).include?(element)}
    valid_numbers.size.should eql 15
    valid_numbers.uniq.size.should eql 15
  end

  it 'has first column with numbers between 1 and 9 or blank' do
    first_column_range = ((1..9).to_a + [0])
    first_column_range.should include @card.column(1)[0]
    first_column_range.should include @card.column(1)[1]
    first_column_range.should include @card.column(1)[2]
  end

  it 'has second column with numbers between 10 and 19 or blank' do
    second_column_range = ((10..19).to_a + [0])
    second_column_range.should include @card.column(2)[0]
    second_column_range.should include @card.column(2)[1]
    second_column_range.should include @card.column(2)[2]
  end

  it 'has nine column with numbers between 80 and 90 or blank' do
    second_column_range = ((80..90).to_a + [0])
    second_column_range.should include @card.column(9)[0]
    second_column_range.should include @card.column(9)[1]
    second_column_range.should include @card.column(9)[2]
  end
end
