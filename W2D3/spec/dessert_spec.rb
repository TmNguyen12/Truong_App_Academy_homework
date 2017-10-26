require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name:"Truong") }
  let(:cookie) {Dessert.new("cookie",14,chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(@type).to eq("Cookies")
    end

    it "sets a quantity" do
      expect(cookie.quantity).to eq(14)
    end

    it "starts ingredients as an empty array" do
      expect(cookie.ingredients).to eql([])
    end

    it "raises an argument error when given a non-integer quantity" do
        expect(Dessert.new("brownie","lawyer",chef)).to raise_error(ArgumentError)
    end

  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cookie.add_ingredient("onions")
      expect(cookie.ingredients).to include(["onions"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["onion","celery", "sugar"]

      ingredients.each do |ingredient|
        cookie.add_ingredient(ingredient)
      end

      expect(cookie.ingredients).to eq(ingredients)
      cookie.mix!
      expect(cookie.ingreds).not_to eq(ingredients)
      expect(cookie.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cookie.eat(2)
      expect(cookie.quantity).to eq(12)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect(cookie.eat(44)).to raise_error("Not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Truong the Great Baker")
      expect(cookie.serve).to eq("Chef Truong the Great Baker has made 14 cookies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cookie)
      cookie.make_more
    end
  end
end
