require 'github/rake/release/version'
require 'github/rake/release/config'
require 'github/rake/release/tasks'

module Github
  module Rake
    module Release
      class << self
        attr_accessor :config
      end

      def self.config
        @config ||= Config.new
      end

      def self.configure
        yield(config)
      end

      def self.reset!
        @config = Config.new
      end
    end
  end
end

Github::Rake::Release::Tasks.new
