Gem::Specification.new do |spec|
  spec.name          = "malicious-jekyll-theme"
  spec.version       = "0.1.0"
  spec.authors       = ["security-research"]
  spec.summary       = "Test theme for security research"
  spec.homepage      = "https://github.com/gn00295120/malicious-jekyll-theme"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(_layouts|_includes|_sass|assets)/}) }
  spec.add_runtime_dependency "jekyll", ">= 3.5"
end
