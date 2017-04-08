require "spec_helper"

RSpec.describe Github::Rake::Release do
  it "has a version number" do
    expect(Github::Rake::Release::VERSION).not_to be nil
  end
end
