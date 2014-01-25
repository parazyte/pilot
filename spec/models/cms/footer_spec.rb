require 'spec_helper'

describe Cms::Footer do
  let(:footer) { Cms::Footer.create }

  it "has a text attribute" do
    footer.should respond_to(:text)
  end
end
