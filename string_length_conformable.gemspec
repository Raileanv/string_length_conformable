lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'string_length_conformable/version'

Gem::Specification.new do |spec|
  spec.name          = 'string_length_conformable'
  spec.version       = StringLengthConformable::VERSION
  spec.authors       = ['Vladimir']
  spec.email         = ['raileanv@gmail.com']

  spec.summary       = 'Gem for validate string length'
  spec.description   = <<-TEXT
    If you have some attributes in your models with type string (varchar(255) by default).
    And you haven't validate length of it, you can face once with a problem when user will
    pass in form field more characters. Then, your database, most probably will throw an error 500.
    To avoid such kind a problems I've createt this gem.
  TEXT

  spec.homepage      = 'https://github.com/Yaponcik/string_length_conformable'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
