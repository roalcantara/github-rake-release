require 'octokit'
require 'rake/tasklib'

module Github
  module Rake
    module Release
      class Tasks < ::Rake::TaskLib
        def initialize
          define_github_auth_task
          define_github_merge_task
          define_github_release_task
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
                puts 'Github Authentication: OK! 🤘'
              rescue => e
                puts e.message
              end
            end
          end
        end

        def define_github_merge_task
          namespace :github do
            desc 'Merges the develop branch into master'
            task :merge do
              sh 'git fetch'
              sh 'git checkout master'
              sh 'git pull'
              sh "git merge origin/#{Github::Rake::Release.config.merge_from}"
              sh 'git push'
            end
          end
        end

        def define_github_release_task
          namespace :github do
            desc 'Merges the develop branch into master and creates a release tag on github'
            task :release, [:version, :title, :body] => ['github:auth', :merge] do |_, args|
              begin
                Octokit.create_release(
                  Github::Rake::Release.config.respository,
                  args.version,
                  name: args.title,
                  body: args.body,
                  target_commitish: :master,
                  draft: false,
                  prerelease: false
                )
                puts "#{args.version} has been released in the wild! 🚀"
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
