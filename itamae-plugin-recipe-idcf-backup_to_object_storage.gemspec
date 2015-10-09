# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'itamae/plugin/recipe/idcf/backup_to_object_storage/version'

Gem::Specification.new do |spec|
  spec.name          = "itamae-plugin-recipe-idcf-backup_to_object_storage"
  spec.version       = Itamae::Plugin::Recipe::Idcf::BackupToObjectStorage::VERSION
  spec.authors       = ["nownabe"]
  spec.email         = ["nownabe@gmail.com"]

  spec.summary       = %q{An itamae plugin to backup directories to IDCF Object Storage}
  spec.homepage      = "https://github.com/nownabe/itamae-plugin-recipe-idcf-backup_to_object_storage"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "itamae"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "serverspec"
end
