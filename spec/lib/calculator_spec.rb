require "spec_helper"
require "calculator"

RSpec.describe Calculator do
  let(:calculator) { Calculator.new }

  describe "#add" do
    it "adds numbers together" do
      expect(calculator.add(1, 2)).to eql(3)
    end
  end
end
