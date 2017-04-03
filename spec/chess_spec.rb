require "chess"

describe Chess do
  context "ready to accept input" do
    describe ".check_move" do
      it "return true for valid moves" do
        x = Chess.new
        expect(x.check_move("a3,b3")).to be(true)
        expect(x.check_move("H8,F1")).to be(true)
        expect(x.check_move("A3,g7")).to be(true)
        expect(x.check_move("d7,E5")).to be(true)
      end

      it "return false for invalid moves" do
        x = Chess.new
        expect(x.check_move("a3s,b3")).to be(false)
        expect(x.check_move("a3,b3s")).to be(false)
        expect(x.check_move("C3,B3s")).to be(false)
      end
    end
  end
end
