require 'spec_helper'

describe Cms::Page do
  let(:page) { Cms::Page.create }

  it "has a name attribute" do
    page.should respond_to(:name)
  end

  it "has a cms_url attribute" do
    page.should respond_to(:cms_url)
  end

  context "#has_parent?" do
    it "returns false" do
      page.should_not have_parent
    end
  end
end
