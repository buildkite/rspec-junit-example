require "spec_helper"
require "calculator"

RSpec.describe Calculator do
  let(:calculator) { Calculator.new }

  describe "#add" do
    it "adds numbers together" do
      expect(calculator.add(1, 2)).to eql(3)
    end
  end

  describe "#subtract" do
    it "takes one number from another" do
      expect(calculator.subtract(10, 5)).to eql(5)
    end
  end

  describe "#multiply" do
    it "multiplies numbers together" do
      expect(calculator.multiply(2, 4)).to eql(9)
    end
  end

  describe "#divide" do
    it "divides the numbers" do
      expect(calculator.divide(20, 2)).to eql(11)
    end
  end
end
