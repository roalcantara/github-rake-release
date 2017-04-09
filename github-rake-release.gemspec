# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'github/rake/release/version'

Gem::Specification.new do |spec|
  spec.name          = 'github-rake-release'
  spec.version       = Github::Rake::Release::VERSION
  spec.authors       = ['Rogério Rodrigues de Alcântara']
  spec.email         = ['rogerio.alcantara@gmail.com']

  spec.summary       = 'Github Release Rake Tasks'
  spec.description   = 'Rake Tasks for Automating Github Releases'
  spec.homepage      = 'https://github.com/roalcantara/github-rake-release'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14.6'
  spec.add_development_dependency 'rspec', '~> 3.5'

  spec.add_dependency 'rake', '~> 12.0'
  spec.add_dependency 'octokit', '~> 4.7'
end
