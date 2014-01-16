require 'spec_helper'

describe SystemVersion do
  let(:version) { FactoryGirl.create(:system_version, major: 1, minor: 2) }

  context ".latest" do
    let!(:old_version) {
      Timecop.freeze(Date.yesterday.beginning_of_day) do
        FactoryGirl.create(:system_version, major: 1, minor: 1)
      end
    }
    let!(:new_version) {
      Timecop.freeze(Date.today.beginning_of_day) do
        FactoryGirl.create(:system_version, major: 1, minor: 2)
      end
    }

    it "responds to the class method :latest" do
      described_class.should respond_to(:latest)
    end

    it "returns the latest SystemVersion with respect to created at" do
      described_class.latest.should == new_version
    end
  end

  context "#name" do
    it "responds to the instance method :name" do
      version.should respond_to(:name)
    end

    it "returns a name based on version numbering" do
      version.name.should == "Pilot v1.2"
    end
  end

  context "#version_name" do
    it "responds to the instance method :version_name" do
      version.should respond_to(:version_name)
    end

    it "returns a major + . + minor as concatenated string" do
      version.version_name.should == "1.2"
    end
  end
end
