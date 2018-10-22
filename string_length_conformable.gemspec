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
  \n
  This gem resolves basically two problems.
  \n
  ---
  \n
  1. MySQL for strings(VARCHAR(255)) by default has limit 255 characters. And when developer left this attribute without any length validation, then it's possible to face with situation when user unintentionally or intentionally will pass in text field more characters. So, then, probably you will get 500...
  \n
  ---
  \n
  2. PostgreSQL. The maximum number of characters for variable unlimited length types (text, varchar) is undefined. There is a limit of size in bytes for all string types: In any case, the longest possible character string that can be stored is about 1 GB.
  And when developer left this attribute without any length validation, then it's possible to face with situation when user unintentionally or intentionally will try to full up your database with lots of GB of 'important' info.
  \n
  ---
  \n
  Both of this cases, I guess, are not very pleasant.
  \n

  This gem adds default length validation for all string attributes.
  Except those which are already vlidated in standart rails way.
  \n

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
