class Board
  attr_accessor :cells

  def initialize
    @cells = [
    "1", "2", "3",
    "4", "5", "6",
    "7", "8", "9"
    ]
  end

  def update_cell(number, mark)
    if cell_free?(number)
      self.cells[number - 1] = mark.to_s
      show_board
    else
      puts "Cell not empty! Choose other cell."
      return false
    end
  end

  def show_board
    hline = "\u2502"
    vline = "\u2500"
    cross = "\u253C"
    row1 = " " + self.cells[0..2].join(" #{hline} ")
    row2 = " " + self.cells[3..5].join(" #{hline} ")
    row3 = " " + self.cells[6..8].join(" #{hline} ")
    separator = vline * 3 + cross + vline * 3 + cross + vline * 3
    system("clear")
    puts row1
    puts separator
    puts row2
    puts separator
    puts row3
  end


  private

  def cell_free?(number)
    cell = self.cells[number - 1]
    if cell == "X" ||  cell == "O"
      false
    else
      true
    end
  end

end