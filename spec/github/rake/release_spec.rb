require 'spec_helper'

RSpec.describe Github::Rake::Release do
  it 'has a version number' do
    expect(Github::Rake::Release::VERSION).not_to be nil
  end

  describe '.configure' do
    before :each do
      Github::Rake::Release.configure do |config|
        config.respository = 'http://some.repo.git'
        config.merge_from = :development
      end
    end

    it 'configures the respository url' do
      expect(Github::Rake::Release.config.respository).to eq 'http://some.repo.git'
    end

    it 'configures branch that master will be merged from' do
      expect(Github::Rake::Release.config.merge_from).to eq :development
    end

    after :each do
      Github::Rake::Release.reset!
    end
  end
end
