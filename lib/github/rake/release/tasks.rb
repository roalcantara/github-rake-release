require 'octokit'
require 'rake/tasklib'

module Github
  module Rake
    module Release
      class Tasks < ::Rake::TaskLib
        def initialize
          define_github_auth_task
        end

        private

        def define_github_auth_task
          namespace :github do
            desc 'GitHub authentication'
            task :auth do
              begin
                Octokit.configure do |c|
                  c.access_token = ENV['GITHUB_ACCESS_TOKEN']
                end

                rate_limit = Octokit.rate_limit!
                puts 'Exceeded limit of the GitHub API request' if rate_limit.remaining.zero?
              rescue => e
                puts e.message
              end
            end
          end
        end
      end
    end
  end
end
