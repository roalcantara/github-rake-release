module Github
  module Rake
    module Release
      class Config
        attr_accessor :respository, :merge_from

        def initialize
          @respository = `git remote get-url origin`.gsub!('https://github.com/', '').gsub!('.git', '')
          @merge_from = :develop
        end
      end
    end
  end
end
