require './mastermind'

describe Code do
  let(:code) { Code.new }
  let(:code2) { Code.new }
  describe "#self.code" do
    it "sets the code directly" do
      code.code = [:R, :R, :B, :B]
      code.code.should == [:R, :R, :B, :B]
    end
  end
  describe "#random_code" do
    it "sets code to some random colors" do
      code.random_code
      ([:R, :G, :B, :Y, :O, :P] & code.code).sort.should == code.code.sort
    end
  end
  describe "#reponse" do
    it "give a string response" do
      code.code = [:B, :G, :O, :L]
      code2.code = [:R, :G, :B, :Y]
      puts code.response(code2.code)
      code.response(code2.code).class.should == String
    end
  end
end