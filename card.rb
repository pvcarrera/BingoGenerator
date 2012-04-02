require 'set'

class Card
  ROWS = 3
  COLUMNS = 9
  DEFAULT_VALUE = 1

  def initialize
    insert_columns
    insert_empty_cells
  end

  def row number
    @card[number -1]    
  end

  def column number
    @card.map { |row| row[number - 1]}
  end

  private

  def rand_n(n,min, max)
    randoms = Set.new
    r = Random.new
    loop do
      randoms << r.rand(min..max)
      return randoms.to_a if randoms.size >= n
    end
  end

  def insert_empty_cells
    @card.collect! do |row|
        gaps = rand_n(4,0,8)
        gaps.each { |index| row[index] = 0 }
        row
    end
  end

  def insert_columns
    cols = Array.new
    (1..7).each do |col|
      current_col = rand_n(3, col * 10, (col + 1) * 10 -1)
      cols << current_col 
    end
    first_col = rand_n(3, 1, 9)
    last_col = rand_n(3, 80, 90)
    @card = first_col.zip(cols[0], cols[1], cols[2], cols[3],cols[4],
                          cols[5],cols[6],last_col )
  end
end
