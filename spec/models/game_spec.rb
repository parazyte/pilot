require 'spec_helper'

describe Game do
  let(:game) { subject.new }

  it "has a name attribute" do
    game.should respond_to(:name)
  end

  it "has an url attribute" do
    game.should respond_to(:url)
  end

  context "validations" do
    it "is not valid without an url" do
      game.should_not be_valid
      game.should have(1).errors_on(:name)
    end

    it "is not valid without a name" do
      game.should_not be_valid
      game.should have(1).errors_on(:url)
    end

    it "is valid with url and name" do
      game.name = "Superheroes 1"
      game.url  = "http://localhost:5000/api/v1/games/2.json"
      game.should be_valid
    end
  end
end
