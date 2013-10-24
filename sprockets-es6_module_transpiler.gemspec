$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "sprockets-es6_module_transpiler"
  s.version     = "0.1.0"
  s.author      = "Christian Wesselhoeft"
  s.email       = "hi@xtian.us"
  s.homepage    = "https://github.com/xtian/sprockets-es6-module-transpiler"
  s.summary     = "Lets you use es6-module-transpiler in your Rails app."
  s.description = s.summary
  s.license     = "MIT"

  s.requirements = "node.js runtime"

  s.files = Dir["{lib,node_modules}/**/*"] + %w{MIT-LICENSE Rakefile README.md package.json}
  # s.test_files = Dir["test/**/*"]
end
