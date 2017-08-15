# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'spiralizer/version'

Gem::Specification.new do |s|
  s.name         = 'spiralizer'
  s.version      = Spiralizer::VERSION
  s.licenses     = ['MIT']
  s.author       = 'Dave Havlicek'
  s.email        = 'snex00@gmail.com'
  s.homepage     = 'https://github.com/snex/spiralizer'
  s.summary      = 'Return matrix elements in "spiral" order.'
  s.description  = 'Takes a two dimensional array and prints the elements in'\
                   'spiral order, starting from [0,0] and going clockwise)'
  s.files        = Dir.glob('lib/**/*') + ['README.md']
  s.test_files   = Dir.glob('spec/**/*')
  s.require_path = 'lib'

  s.required_ruby_version = '~>2.4'

  s.add_development_dependency 'coveralls', '~> 0.7'
  s.add_development_dependency 'rake', '~> 12.0'
  s.add_development_dependency 'rspec', '~> 3.6'
  s.add_development_dependency 'rubocop', '~> 0.49'
  s.add_development_dependency 'simplecov', '~> 0.15'
end
