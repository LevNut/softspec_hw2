
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gem_assignment/version"

Gem::Specification.new do |spec|
  spec.name          = "gem_assignment"
  spec.version       = GemAssignment::VERSION
  spec.authors       = ["LevNut"]
  spec.email         = ["teeranut.s@ku.th"]

  spec.summary       = %q{SET stocks data reader}
  spec.description   = %q{A ruby script which it will represent all the data of SET stocks company name and total assets Name: Teeranut Sawanyawat, ID: 6210545491}
  spec.homepage      = "https://github.com/LevNut/softspec_hw2"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/LevNut/softspec_hw2"
    spec.metadata["changelog_uri"] = "https://github.com/LevNut/softspec_hw2/blob/master/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_dependency "httparty", "~> 0.18.1"
  spec.add_dependency "nokogiri", "~> 1.11.1"
end
