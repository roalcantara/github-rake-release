module Github
  module Rake
    module Release
      class Config
        attr_accessor :respository, :merge_from

        def initialize
          @respository = `git config --get remote.origin.url`
          @merge_from = :develop
        end
      end
    end
  end
end
