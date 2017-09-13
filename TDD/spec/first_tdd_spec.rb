require "first_tdd"
require "rspec"

describe "#my_uniq" do

  let(:dups_array) {Array.new([1, 2, 3, 3, 4, 1])}
  let(:no_dups_array) {Array.new([1, 2, 3])}

  context "when an array has duplicates" do
    it "returns an array with no duplicates" do
      expect(dups_array.my_uniq).to eq([1, 2, 3, 4])
    end
  end

  context "when an array doesn't have duplicates" do
    it "returns an array with no duplicates" do
      expect(no_dups_array.my_uniq).to eq([1, 2, 3])
    end
  end


end

describe "#two_sum" do
  let(:array) {Array.new([1, 2, 3, -3, 4, -1])}

  it "should return an array" do
    expect(array.two_sum).to be_an_instance_of(Array)
  end

  context "pairs exist within the array" do
    it "should return an array of arrays" do
      expect(array.two_sum[0]).to be_an_instance_of(Array)
    end

    it "should return the index of pairs" do
      expect(array.two_sum).to eq([[0, 5],[2,3]]).or eq([[2,3],[0,5]]).or eq([[5,0],[3,2]])
    end

    it "should return the index of pairs in low-to-high order" do
      expect(array.two_sum).to eq([[0, 5],[2,3]])
    end

  end
end

describe "#my_transpose" do
  let(:array) {Array.new([[0, 1, 2], [3, 4, 5], [6, 7, 8]])}
  let(:array_without_elements) {Array.new([])}

  it "should return an array" do
    expect(array.my_transpose).to be_an_instance_of(Array)
  end

  it "should return nil if array doesn't contain any elements" do
    expect(array_without_elements.my_transpose).to eq(nil)
  end

  it "should return a set of arrays with the same length as input" do
    expect(array.my_transpose.length).to eq(array.length)
  end

  it 'should return a set of arrays reordered by column' do
    expect(array.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end
end

describe '#stock_picker' do
  let(:array_obj) {Array.new}
  stock_prices = [25, 30, 35, 33, 22, 75]

  it "sets a start date and an end date" do
    array_obj.stock_picker(stock_prices)
    expect(array_obj.start_date).to eq(4)
    expect(array_obj.end_date).to eq(5)
  end

  it "should return an array" do
    expect(array_obj.stock_picker(stock_prices)).to be_an_instance_of(Array)
  end

  it "should have an end date after the start date" do
    array_obj.stock_picker(stock_prices)
    array_obj.start_date.should be < array_obj.end_date
  end

  it "should return the most profitable pair" do
    expect(array_obj.stock_picker(stock_prices)).to eq([4, 5])
  end

end

describe TowersOfHanoi do
  let(:new_game) {TowersOfHanoi.new}

  describe '#initialize' do
    it "creates three arrays: the first with the full stack and the others empty" do
      expect(new_game.stack.length).to eq(3)
      expect(new_game.stack.first).to eq([1, 2, 3])
    end
  end



  describe '#make_move' do
    let(:game2) {TowersOfHanoi.new}
    it "moves the discs as expected" do
      game2.make_move(0, 2)
      expect(game2.stack[0].length).to eq(2)
      expect(game2.stack[2].length).to eq(1)
    end
  end

  describe '#valid_move?' do
    let(:game2) {TowersOfHanoi.new}
    it "returns false when player tries to place larger on smaller" do
      game2.make_move(0, 2)
      expect(game2.valid_move?(0, 2)).to be false
    end

    it "returns false when selected tower doesn't exist" do
      expect(game2.valid_move?(0, 4)).to be false
    end
  end


  describe '#won?' do
    let(:game3) {TowersOfHanoi.new}
    it "returns true when the stack is reassembled in order on another stack" do
      game3.make_move(0, 2)
      game3.make_move(0, 1)
      game3.make_move(2, 1)
      game3.make_move(0, 2)
      game3.make_move(1, 0)
      game3.make_move(1, 2)
      game3.make_move(0, 2)
      expect(game3.won?).to be true
    end
  end
end
