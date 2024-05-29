require 'spec_helper'
require_relative 'calculator'

describe Calculator do
  before(:each) do
    @calculator = Calculator.new
  end

  describe "#add" do
    context "with an empty string" do
      it "returns 0" do
        expect(@calculator.add("")).to eql(0)
      end
    end

    context "Add multiple numbers separated by commas" do
      it "It will print the sum of all numbers" do
        expect(@calculator.add("1,2,3")).to eql(6)
      end
    end

    context "with a single number" do
        it "returns the number" do
          expect(@calculator.add("5")).to eql(5)
        end
    end

    context "with a custom delimiter" do
      it "returns the sum of numbers using the custom delimiter" do
        expect(@calculator.add("//;\n1;2;3")).to eql(6)
      end
    end

    context "with negative numbers" do
      it "raises an exception with the negative number(s)" do
        expect { @calculator.add("-4") }.to raise_error(RuntimeError, "negative numbers not allowed -4")
      end
    end

    context "with new lines between numbers" do
      it "treats new lines as delimiters" do
        expect(@calculator.add("1\n2,3")).to eql(6)
      end
    end
  end
end
