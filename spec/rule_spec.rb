class Rule
  def self.process(state, num_neighbors)
    return false unless (state == :living && num_neighbors == 2)  ||
                        num_neighbors == 3
    true
  end
end

describe "Game of Life rules" do
  let(:rule) { Rule }

  describe "when run given a living cell" do
    it "should kill the cell if it has no living neighbors" do
      rule.process(:living, 0).should be_false
    end

    it "should kill the cell dead if it has 1 living neighbor" do
      rule.process(:living, 1).should be_false
    end

    it "should let the cell live if it has 2 living neighbors" do
      rule.process(:living, 2).should be_true
    end

    it "should let the cell live if it has 3 living neighbors" do
      rule.process(:living, 3).should be_true
    end

    it "should kill the cell dead if it has 4 living neighbors" do
      rule.process(:living, 4).should be_false
    end
  end

  describe "when run given a dead cell" do
    it "should leave the cell dead it has 2 living neighbors" do
      rule.process(:dead, 2).should be_false
    end

    it "should bring the cell to life it has 3 living neighbors" do
      rule.process(:dead, 3).should be_true
    end
  end
end
