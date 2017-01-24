# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/long_time_specs_profiler'

Gem::Specification.new do |spec|
  spec.name          = 'rspec-long_time_specs_profiler'
  spec.version       = RSpec::LongTimeSpecsProfiler::VERSION
  spec.authors       = ['ryu39']
  spec.email         = ['dev.ryu39@gmail.com']

  spec.summary       = %q{A RSpec 2.x formatter which shows longest time spec files.}
  spec.description   = %q{A RSpec 2.x formatter which shows longest time spec files.}
  spec.homepage      = 'https://github.com/ryu39/rspec-long_time_specs_profiler'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency     'rspec', '~> 2.0'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
end
