require 'spec_helper'

describe Cms::Header do
  let(:header) { Cms::Header.create }

  it "has a text attribute" do
    header.should respond_to(:text)
  end
end
